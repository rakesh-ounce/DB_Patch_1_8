DECLARE

	CURSOR C1 IS 
		select distinct 
			b.org_id , 
			b.org_code ,
			a.role_name 
		from  
			XXAAS_USER_APP_ROLE_V a , 
			XXAAS_USER_ORG_V b
		where 
			a.user_id = b.user_id    
		order by 2;
		
	CURSOR C2 (P_ORG_ID IN NUMBER) IS
		SELECT *
		FROM	XXAAS_USER_ORGS
		WHERE ORG_ID= P_ORG_ID;
			
		
		
BEGIN

	FOR a1 in C1 
	LOOP
		
		INSERT INTO DISTRIBUTION_GROUPS
		(
			CLIENT_ID,
			GROUP_NAME,
			DESCRIPTION
		)
		VALUES
		(
			1,
			a1.org_code||' '||a1.role_name,
			'For '||a1.org_code||' '||a1.role_name
			
		);
		
		INSERT INTO XXAAS_ORG_DIST_GROUPS
		(
			CLIENT_ID,
			DIST_GROUP_ID,
			ORG_ID
		)
		VALUES
		(
			1,
			(SELECT  DIST_GROUP_ID FROM DISTRIBUTION_GROUPS WHERE GROUP_NAME=(a1.org_code||' '||a1.role_name)),
			a1.org_id
			
		);
		
		FOR a2 in C2(a1.org_id) 
		LOOP
			INSERT INTO DISTRIBUTION_GROUP_DETAILS
			(
				CLIENT_ID,
				DIST_GROUP_ID,
				USER_ID
			)
			VALUES
			(
				1,
				(SELECT  DIST_GROUP_ID FROM DISTRIBUTION_GROUPS WHERE GROUP_NAME=(a1.org_code||' '||a1.role_name)),
				a2.user_id
				
			);
		END LOOP;
	END LOOP;
	
END;


--xxaas_profile_values
BEGIN

	INSERT INTO xxaas_profile_values (
    client_id,
    profile_value_id,
    profile_name,
    profile_level,
    profile_level_value,
    profile_value,
    profile_value_desc
)
values(
    1,
    xxaas_profile_value_seq.nextval,
    'OVERRIDE_EMAIL_ADDRESS',
    'APPLICATION',
    'Formulation',
    'kiranmai.aluvoji@proounce.com,rakesh.kathula@proounce.com ,gurpreet.singh@proounce.com',
    'Emails of DEV Team'
);
END;