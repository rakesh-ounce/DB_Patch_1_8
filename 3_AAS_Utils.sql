CREATE OR REPLACE PACKAGE AAS_UTILS 
AS
    --function which will return email addresses
    FUNCTION GET_EMAIL_ADDRESSES(P_ORG_ID NUMBER,P_USER_NAME VARCHAR2,P_APPLICATION_NAME VARCHAR2)
    RETURN VARCHAR2;
    
END AAS_UTILS;
/

CREATE OR REPLACE PACKAGE BODY AAS_UTILS 
AS
    --function which will return email addresses
    FUNCTION GET_EMAIL_ADDRESSES(P_ORG_ID NUMBER,P_USER_NAME VARCHAR2,P_APPLICATION_NAME VARCHAR2)
    RETURN VARCHAR2
    IS
        v_profile_value 			varchar2(4000);
		v_emails 					varchar2(4000);
		
		cursor c_budget_approver_emails is 
		select  email 
		from    distribution_group_v 
		where   1=1
		AND     org_id        = P_ORG_ID
		AND     email_flag    = 'Y'
		and     group_name    like '%Budget Approver';
		
		Cursor c_org_default_emails IS
		select  distinct default_email_address email_address
        from    distribution_group_v 
        where   1=1
        AND     org_id  = P_ORG_ID;
		
		
    BEGIN
        
        select  profile_value into v_profile_value
        from    xxaas_profile_values 
        where   1=1
        AND     profile_name		= 'IS_EMAIL_OVERRIDING_ENABLED'
		AND 	profile_level       = 'APPLICATION'
        AND     PROFILE_LEVEL_VALUE = P_APPLICATION_NAME;
        
        IF  v_profile_value = 'Yes' THEN
            select  profile_value into v_profile_value
            from    xxaas_profile_values 
            where   1=1
            AND     profile_name		= 'OVERRIDE_EMAIL_ADDRESS'
			AND 	profile_level       = 'APPLICATION'
            AND     PROFILE_LEVEL_VALUE = P_APPLICATION_NAME;
            
            return nvl(v_profile_value,'NA');
            
        END IF;
		
		/************************************************************************
			if email_override is No then check to whom we need to send the email
		**************************************************************************/
		select  profile_value into v_profile_value
        from    xxaas_profile_values 
        where   1=1
        AND     profile_name		= 'SEND_EMAILS_TO'
		AND 	profile_level       = 'APPLICATION'
        AND     PROFILE_LEVEL_VALUE = P_APPLICATION_NAME;
		
		IF v_profile_value = 'TO_DEFAULT' THEN
			
			FOR c2 in c_org_default_emails LOOP
				v_emails := v_emails ||c2.email_address||',';
			END LOOP;
			
			return nvl(v_emails,'NA');
		
		ELSIF v_profile_value = 'TO_USERS' THEN
			
			--Who submits the request
			--all budget approvers
			
			SELECT 	nvl( 
							(   select  email email_address
								from    xxaas_users 
								where   1=1
								AND 	user_name 	= P_USER_NAME 
								and 	email_flag	= 'Y'
							)
							,'NA'
					  ) 
			INTO 	v_profile_value
			from dual;
				
			v_emails := v_emails ||v_profile_value||',';
			
			FOR c1 in c_budget_approver_emails LOOP				
				v_emails := v_emails ||c1.email||',';
			END LOOP;
			
			return NVL(v_emails,'NA');
			
		END IF;
	
	EXCEPTION
		WHEN OTHERS THEN
			return 'ERROR';    
    END GET_EMAIL_ADDRESSES;
    
    
END AAS_UTILS;
