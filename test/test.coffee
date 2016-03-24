{ expect } = require 'chai'

_ = require 'lodash'
sbvrTypes = require '@resin/sbvr-types'
{ SBVRParser } = require('@resin/sbvr-parser')
LF2AbstractSQL = require '@resin/lf-to-abstract-sql'
AbstractSQLCompiler = require '@resin/abstract-sql-compiler'
AbstractSQL2ODataSchema = require '..'

ExtendedSBVRParser = SBVRParser._extend
	initialize: ->
		SBVRParser.initialize.call(@)
		@AddCustomAttribute('Database ID Field:')
		@AddCustomAttribute('Database Table Name:')
		@
LF2AbstractSQLTranslator = LF2AbstractSQL.createTranslator(sbvrTypes)

module.exports = exports = (builtInVocab = false) ->
	sbvrParser = ExtendedSBVRParser.createInstance()
	sbvrParser.enableReusingMemoizations(SBVRParser._sideEffectingRules)

	LF2AbstractSQL = require '@resin/lf-to-abstract-sql'
	LF2AbstractSQLTranslator = LF2AbstractSQL.createTranslator(sbvrTypes)

	if builtInVocab
		sbvrParser.AddBuiltInVocab(builtInVocab)

	seSoFar = ''

	runExpectation = (describe, input, expectation) ->
		it input, ->
			try
				sbvrParser.reset()
				lf = sbvrParser.matchAll(seSoFar + input, 'Process')
				abstractSqlModel = LF2AbstractSQLTranslator(lf, 'Process')
				sqlModel = AbstractSQLCompiler.postgres.compileSchema(abstractSqlModel)
				result = AbstractSQL2ODataSchema(sqlModel)
			catch e
				expectation(e)
				return
			expectation(result)

	runSchema = (describe, input, expectation) ->
		runExpectation describe, input, (result) ->
			seSoFar += input + '\n'
			if _.isFunction(expectation)
				expectation(result)
			else if _.isError(result)
				throw result
			else
				# require('fs').writeFileSync('./client-model.json', JSON.stringify(result, null, '\t'))
				expect(result).to.deep.equal(expectation)
				# it 'should have a resources property', ->
					# expect(result).to.have.property('resources')
				# it 'and a resourceToSQLMappings property', ->
					# expect(result).to.have.property('resourceToSQLMappings')
				# # Individually match the statements in order to get a nicer diff if they don't match.
				# keys = _.uniq _.concat(_.keys(result.resources), _.keys(expectation))
				# for key in keys
					# it "expect '#{key}' to match", ->
						# expect(result.resources[key]).to.deep.equal(expectation[key])

	ret = runSchema.bind(null, describe)
	ret.skip = runSchema.bind(null, describe.skip)
	ret.only = runSchema.bind(null, describe.only)
	return ret
