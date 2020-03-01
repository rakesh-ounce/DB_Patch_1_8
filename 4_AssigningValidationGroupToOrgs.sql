DECLARE

	CURSOR c is
	SELECT * 
	FROM XXAAS_ORGS
	WHERE PARENT_ORG_ID=0 and ORG_ID <>1775;
	
BEGIN
	
	FOR c1 in c LOOP
	
		INSERT INTO ORG_VALIDATION_GROUPS
		(
			CLIENT_ID          ,
			APPLICATION_ID     ,
			ORG_VALIDATION_GROUP_ID ,
			GROUP_ID    		  ,
			FISCAL_YEAR,
			ORG_ID          	  ,
			ORG_LEVEL          
		)
		VALUES(
			1,
			(select application_id from applications where application_name='Formulation'),
			ORG_VALIDATION_GROUP_SEQ.nextval,
			(select group_id from XXAAS1.VALIDATION_GROUPS where group_name='REQUEST_GROUP'),
			2020,
			c1.org_id,
			'1'
		);
		
		
	END LOOP;
	
	
	
		
	
END;