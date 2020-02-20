https://stackoverflow.com/questions/338156/table-naming-dilemma-singular-vs-plural-names


json_agg                   табличная выдача преобразовать в объем - жсон массив  
json_array_elements                       объект жсон массив преобразовать в табличную выдачу  SELECT value  FROM json_array_elements('[1,8]'::json)
json_object_agg                 из выдачи типа кей валью сделать объект в котором кей валью кей валю и тд SELECT json_object_agg(a,b)FROM aaa

array_agg  превратить выборку в массив []

json_array_elements


	есть круд
    
    
    
    api.dictionary__update
    ---v_is_update = crud.dictionary_update(v_id_dictionary, v_code, v_name, v_public, v_has_hierarchy, v_use_guid, v_descr, v_systemName, v_publisher, v_email, v_versioning, v_use_code_as_guid, v_id_user, v_status, v_dictionary_type);
    
    
    
    
    
экспериментируем тут
	
draft_madick_versioning2level_1
    
    
    {
    "items": [
        {
        
        
        
            "code": "2",
            "error": "",
            "regime": "item_update",
            "system": "draft_madick_versioning2level_3",
            "message": "",
            "updated": false,
            "id_dictionary": 384,
            "id_dictionary_item": 502274
        },
        {
            "code": "1",
            "error": "",
            "regime": "item_update",
            "system": "draft_madick_versioning2level_3",
            "message": "",
            "updated": false,
            "id_dictionary": 384,
            "id_dictionary_item": 502275
        }
    ],
    "errors": false,
    "attributes": [
        {
            "code": "code",
            "name": "Код",
            "regime": "modify",
            "id_attribute": 1635,
            "id_dictionary": 384
        },
        {
            "code": "display",
            "name": "Наименование",
            "regime": "modify",
            "id_attribute": 1636,
            "id_dictionary": 384
        }
    ],
    "dictionary": [
        {
            "code": [
                "draft_madick_versioning2level_3",
                "draft_madick_versioning2level_extracode1_3",
                "draft_madick_versioning2level_extracode2_3"
            ],
            "regime": "update",
            "result": false,
            "id_dictionary": 384
        }
    ],
    "version_changed_for_oids": []
}






crud.user_role_relation_delete(
	p_id_user_ref numeric,
	p_id_user_role numeric,
	p_id_dictionary numeric,
	p_id_dictionary_item numeric,
	p_id_user numeric)
    
    
    