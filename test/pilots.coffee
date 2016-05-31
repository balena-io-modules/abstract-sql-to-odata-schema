typeVocab = require('fs').readFileSync(require.resolve('@resin/sbvr-types/Type.sbvr'))
test = require('./test')(typeVocab)

describe 'pilots', ->
	test '''
		Term:       name
			Concept Type: Short Text (Type)

		Term:       age
			Concept Type: Integer (Type)

		Term:       favourite colour
			Concept Type: Color (Type)

		Term:       hire date
			Concept Type: Date Time (Type)

		Term:       licence

		Fact type:  licence has name
			Necessity: each licence has exactly one name

		Term:       team
			Database ID Field: favourite colour
		Fact type:  team has favourite colour
			Necessity: each team has exactly one favourite colour

		Term:       plane

		Fact type:  plane has name
			Necessity: each plane has exactly one name

		Term:      person

		Term:       pilot
			Concept Type: person

		Fact type:  pilot is experienced

		Fact type:  pilot has name
			Necessity: each pilot has exactly one name

		Fact type:  pilot has age
			Necessity: each pilot has exactly one age

		Fact type:  pilot has favourite colour
			Necessity: each pilot has exactly one favourite colour

		Fact type:  pilot can fly plane

		Fact type:  pilot is on team
			Necessity: each pilot is on exactly one team

		Fact type:  pilot has licence
			Necessity: each pilot has exactly one licence

		Fact type:  pilot has hire date
			Necessity: each pilot has exactly one hire date
	''', {
		"resources": {
			"licence": {
				"resourceName": "licence",
				"modelName": "licence",
				"topLevel": true,
				"fields": [
					{
						"dataType": "Date Time",
						"fieldName": "created at",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": "CURRENT_TIMESTAMP"
					},
					{
						"dataType": "Serial",
						"fieldName": "id",
						"required": true,
						"index": "PRIMARY KEY",
						"references": null,
						"defaultValue": null
					},
					{
						"dataType": "Short Text",
						"fieldName": "name",
						"required": true,
						"index": null,
						"references": {
							"tableName": "name",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "id",
				"referenceScheme": "id",
				"actions": [
					"view",
					"add",
					"edit",
					"delete"
				]
			},
			"licence__has__name": {
				"resourceName": "licence__has__name",
				"modelName": "licence has name",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "licence",
						"required": true,
						"index": null,
						"references": {
							"tableName": "licence",
							"fieldName": "id"
						}
					},
					{
						"dataType": "Short Text",
						"fieldName": "name",
						"required": true,
						"index": null,
						"references": {
							"tableName": "name",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "licence",
				"referenceScheme": "name",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"team": {
				"resourceName": "team",
				"modelName": "team",
				"topLevel": true,
				"fields": [
					{
						"dataType": "Date Time",
						"fieldName": "created at",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": "CURRENT_TIMESTAMP"
					},
					{
						"dataType": "Color",
						"fieldName": "favourite colour",
						"required": true,
						"index": null,
						"references": {
							"tableName": "favourite_colour",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "favourite colour",
				"referenceScheme": "id",
				"actions": [
					"view",
					"add",
					"edit",
					"delete"
				]
			},
			"team__has__favourite_colour": {
				"resourceName": "team__has__favourite_colour",
				"modelName": "team has favourite colour",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "team",
						"required": true,
						"index": null,
						"references": {
							"tableName": "team",
							"fieldName": "favourite colour"
						}
					},
					{
						"dataType": "Color",
						"fieldName": "favourite colour",
						"required": true,
						"index": null,
						"references": {
							"tableName": "favourite_colour",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "team",
				"referenceScheme": "favourite colour",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"plane": {
				"resourceName": "plane",
				"modelName": "plane",
				"topLevel": true,
				"fields": [
					{
						"dataType": "Date Time",
						"fieldName": "created at",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": "CURRENT_TIMESTAMP"
					},
					{
						"dataType": "Serial",
						"fieldName": "id",
						"required": true,
						"index": "PRIMARY KEY",
						"references": null,
						"defaultValue": null
					},
					{
						"dataType": "Short Text",
						"fieldName": "name",
						"required": true,
						"index": null,
						"references": {
							"tableName": "name",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "id",
				"referenceScheme": "id",
				"actions": [
					"view",
					"add",
					"edit",
					"delete"
				]
			},
			"plane__has__name": {
				"resourceName": "plane__has__name",
				"modelName": "plane has name",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "plane",
						"required": true,
						"index": null,
						"references": {
							"tableName": "plane",
							"fieldName": "id"
						}
					},
					{
						"dataType": "Short Text",
						"fieldName": "name",
						"required": true,
						"index": null,
						"references": {
							"tableName": "name",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "plane",
				"referenceScheme": "name",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"person": {
				"resourceName": "person",
				"modelName": "person",
				"topLevel": true,
				"fields": [
					{
						"dataType": "Date Time",
						"fieldName": "created at",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": "CURRENT_TIMESTAMP"
					},
					{
						"dataType": "Serial",
						"fieldName": "id",
						"required": true,
						"index": "PRIMARY KEY",
						"references": null,
						"defaultValue": null
					}
				],
				"idField": "id",
				"referenceScheme": "id",
				"actions": [
					"view",
					"add",
					"edit",
					"delete"
				]
			},
			"pilot": {
				"resourceName": "pilot",
				"modelName": "pilot",
				"topLevel": true,
				"fields": [
					{
						"dataType": "Date Time",
						"fieldName": "created at",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": "CURRENT_TIMESTAMP"
					},
					{
						"dataType": "Serial",
						"fieldName": "id",
						"required": true,
						"index": "PRIMARY KEY",
						"references": null,
						"defaultValue": null
					},
					{
						"dataType": "ConceptType",
						"fieldName": "person",
						"required": true,
						"index": null,
						"references": {
							"tableName": "person",
							"fieldName": "id"
						},
						"defaultValue": null
					},
					{
						"dataType": "Boolean",
						"fieldName": "is experienced",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": null
					},
					{
						"dataType": "Short Text",
						"fieldName": "name",
						"required": true,
						"index": null,
						"references": {
							"tableName": "name",
							"fieldName": null
						},
						"defaultValue": null
					},
					{
						"dataType": "Integer",
						"fieldName": "age",
						"required": true,
						"index": null,
						"references": {
							"tableName": "age",
							"fieldName": null
						},
						"defaultValue": null
					},
					{
						"dataType": "Color",
						"fieldName": "favourite colour",
						"required": true,
						"index": null,
						"references": {
							"tableName": "favourite_colour",
							"fieldName": null
						},
						"defaultValue": null
					},
					{
						"dataType": "ForeignKey",
						"fieldName": "team",
						"required": true,
						"index": null,
						"references": {
							"tableName": "team",
							"fieldName": "favourite colour"
						},
						"defaultValue": null
					},
					{
						"dataType": "ForeignKey",
						"fieldName": "licence",
						"required": true,
						"index": null,
						"references": {
							"tableName": "licence",
							"fieldName": "id"
						},
						"defaultValue": null
					},
					{
						"dataType": "Date Time",
						"fieldName": "hire date",
						"required": true,
						"index": null,
						"references": {
							"tableName": "hire_date",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "id",
				"referenceScheme": "id",
				"actions": [
					"view",
					"add",
					"edit",
					"delete"
				]
			},
			"pilot__is_experienced": {
				"resourceName": "pilot__is_experienced",
				"modelName": "pilot is experienced",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						}
					},
					{
						"dataType": "Boolean",
						"fieldName": "is experienced",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": null
					}
				],
				"idField": "pilot",
				"referenceScheme": "is experienced",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"pilot__has__name": {
				"resourceName": "pilot__has__name",
				"modelName": "pilot has name",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						}
					},
					{
						"dataType": "Short Text",
						"fieldName": "name",
						"required": true,
						"index": null,
						"references": {
							"tableName": "name",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "pilot",
				"referenceScheme": "name",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"pilot__has__age": {
				"resourceName": "pilot__has__age",
				"modelName": "pilot has age",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						}
					},
					{
						"dataType": "Integer",
						"fieldName": "age",
						"required": true,
						"index": null,
						"references": {
							"tableName": "age",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "pilot",
				"referenceScheme": "age",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"pilot__has__favourite_colour": {
				"resourceName": "pilot__has__favourite_colour",
				"modelName": "pilot has favourite colour",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						}
					},
					{
						"dataType": "Color",
						"fieldName": "favourite colour",
						"required": true,
						"index": null,
						"references": {
							"tableName": "favourite_colour",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "pilot",
				"referenceScheme": "favourite colour",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"pilot__can_fly__plane": {
				"resourceName": "pilot__can_fly__plane",
				"modelName": "pilot can fly plane",
				"topLevel": false,
				"fields": [
					{
						"dataType": "Date Time",
						"fieldName": "created at",
						"required": true,
						"index": null,
						"references": null,
						"defaultValue": "CURRENT_TIMESTAMP"
					},
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						},
						"defaultValue": null
					},
					{
						"dataType": "ForeignKey",
						"fieldName": "plane",
						"required": true,
						"index": null,
						"references": {
							"tableName": "plane",
							"fieldName": "id"
						},
						"defaultValue": null
					},
					{
						"dataType": "Serial",
						"fieldName": "id",
						"required": true,
						"index": "PRIMARY KEY",
						"references": null,
						"defaultValue": null
					}
				],
				"idField": "id",
				"actions": [
					"view",
					"add",
					"edit",
					"delete"
				]
			},
			"pilot__is_on__team": {
				"resourceName": "pilot__is_on__team",
				"modelName": "pilot is on team",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						}
					},
					{
						"dataType": "ForeignKey",
						"fieldName": "team",
						"required": true,
						"index": null,
						"references": {
							"tableName": "team",
							"fieldName": "favourite colour"
						},
						"defaultValue": null
					}
				],
				"idField": "pilot",
				"referenceScheme": "team",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"pilot__has__licence": {
				"resourceName": "pilot__has__licence",
				"modelName": "pilot has licence",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						}
					},
					{
						"dataType": "ForeignKey",
						"fieldName": "licence",
						"required": true,
						"index": null,
						"references": {
							"tableName": "licence",
							"fieldName": "id"
						},
						"defaultValue": null
					}
				],
				"idField": "pilot",
				"referenceScheme": "licence",
				"actions": [
					"view",
					"add",
					"delete"
				]
			},
			"pilot__has__hire_date": {
				"resourceName": "pilot__has__hire_date",
				"modelName": "pilot has hire date",
				"topLevel": false,
				"fields": [
					{
						"dataType": "ForeignKey",
						"fieldName": "pilot",
						"required": true,
						"index": null,
						"references": {
							"tableName": "pilot",
							"fieldName": "id"
						}
					},
					{
						"dataType": "Date Time",
						"fieldName": "hire date",
						"required": true,
						"index": null,
						"references": {
							"tableName": "hire_date",
							"fieldName": null
						},
						"defaultValue": null
					}
				],
				"idField": "pilot",
				"referenceScheme": "hire date",
				"actions": [
					"view",
					"add",
					"delete"
				]
			}
		},
		"resourceToSQLMappings": {
			"licence": {
				"_name": "licence",
				"created_at": [
					"licence",
					"created at"
				],
				"id": [
					"licence",
					"id"
				],
				"name": [
					"licence",
					"name"
				]
			},
			"licence__has__name": {
				"_name": "licence",
				"licence": [
					"licence",
					"id"
				],
				"name": [
					"licence",
					"name"
				]
			},
			"team": {
				"_name": "team",
				"created_at": [
					"team",
					"created at"
				],
				"favourite_colour": [
					"team",
					"favourite colour"
				]
			},
			"team__has__favourite_colour": {
				"_name": "team",
				"team": [
					"team",
					"favourite colour"
				],
				"favourite colour": [
					"team",
					"favourite colour"
				]
			},
			"plane": {
				"_name": "plane",
				"created_at": [
					"plane",
					"created at"
				],
				"id": [
					"plane",
					"id"
				],
				"name": [
					"plane",
					"name"
				]
			},
			"plane__has__name": {
				"_name": "plane",
				"plane": [
					"plane",
					"id"
				],
				"name": [
					"plane",
					"name"
				]
			},
			"person": {
				"_name": "person",
				"created_at": [
					"person",
					"created at"
				],
				"id": [
					"person",
					"id"
				]
			},
			"pilot": {
				"_name": "pilot",
				"created_at": [
					"pilot",
					"created at"
				],
				"id": [
					"pilot",
					"id"
				],
				"person": [
					"pilot",
					"person"
				],
				"is_experienced": [
					"pilot",
					"is experienced"
				],
				"name": [
					"pilot",
					"name"
				],
				"age": [
					"pilot",
					"age"
				],
				"favourite_colour": [
					"pilot",
					"favourite colour"
				],
				"team": [
					"pilot",
					"team"
				],
				"licence": [
					"pilot",
					"licence"
				],
				"hire_date": [
					"pilot",
					"hire date"
				]
			},
			"pilot__is_experienced": {
				"_name": "pilot",
				"pilot": [
					"pilot",
					"id"
				],
				"is experienced": [
					"pilot",
					"is experienced"
				]
			},
			"pilot__has__name": {
				"_name": "pilot",
				"pilot": [
					"pilot",
					"id"
				],
				"name": [
					"pilot",
					"name"
				]
			},
			"pilot__has__age": {
				"_name": "pilot",
				"pilot": [
					"pilot",
					"id"
				],
				"age": [
					"pilot",
					"age"
				]
			},
			"pilot__has__favourite_colour": {
				"_name": "pilot",
				"pilot": [
					"pilot",
					"id"
				],
				"favourite colour": [
					"pilot",
					"favourite colour"
				]
			},
			"pilot__can_fly__plane": {
				"_name": "pilot-can_fly-plane",
				"created_at": [
					"pilot-can_fly-plane",
					"created at"
				],
				"pilot": [
					"pilot-can_fly-plane",
					"pilot"
				],
				"plane": [
					"pilot-can_fly-plane",
					"plane"
				],
				"id": [
					"pilot-can_fly-plane",
					"id"
				]
			},
			"pilot__is_on__team": {
				"_name": "pilot",
				"pilot": [
					"pilot",
					"id"
				],
				"team": [
					"pilot",
					"team"
				]
			},
			"pilot__has__licence": {
				"_name": "pilot",
				"pilot": [
					"pilot",
					"id"
				],
				"licence": [
					"pilot",
					"licence"
				]
			},
			"pilot__has__hire_date": {
				"_name": "pilot",
				"pilot": [
					"pilot",
					"id"
				],
				"hire date": [
					"pilot",
					"hire date"
				]
			}
		}
	}