		  
CREATE OR REPLACE VIEW XXAAS_REQUEST_DETAILS_V
AS
   SELECT c.CLIENT_ID,
          c.CLIENT_NAME,
          c.CLIENT_SHORT_NAME,
          XR.ORG_ID,
          (select org.org_num from xxaas_orgs org where XR.ORG_ID=org.ORG_ID) org_num,
          (select org.org_code from xxaas_orgs org where XR.ORG_ID=org.ORG_ID) org_code,
          (select org.org_num||' - '||org.org_name from xxaas_orgs org where XR.ORG_ID=org.ORG_ID) org_desc,
          XR.SUB_ORG_ID,
          (select org.org_num  from xxaas_orgs org where XR.SUB_ORG_ID=org.ORG_ID) sub_org_num,		  
          (select org.org_code from xxaas_orgs org where XR.SUB_ORG_ID=org.ORG_ID) sub_org_code,
          (select org.org_num||' - '||org.org_name from xxaas_orgs org where XR.SUB_ORG_ID=org.ORG_ID) sub_org_desc,
          XR.REQUEST_ID,
          XR.REQUEST_NUMBER,
          XR.FISCAL_YEAR,
          XR.REQUEST_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'REQUEST_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.REQUEST_TYPE)
             REQUEST_TYPE_DESC,
          XR.PRIORITY,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'PRIORITY_NO'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.PRIORITY)
             PRIORITY_DESC,
          XR.PROJECT_DESCRIPTION,
          XR.COMMENTS,
          XR.PROCURE_CATEGORY,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'PROCUREMENT_CATEGORY'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.PROCURE_CATEGORY)
             PROCURE_CATEGORY_DESC,
          XR.PROCURE_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'PROCUREMENT_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.PROCURE_TYPE)
             PROCURE_TYPE_DESC,
          XR.COMPETITION_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'COMPETITION_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.COMPETITION_TYPE)
             COMPETITION_TYPE_DESC,
          XR.PROPOSED_COST_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'PROPOSED_COST_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.PROPOSED_COST_TYPE)
             PROPOSED_COST_TYPE_DESC,
          XR.PROJECTED_DURATION,
          XR.ESTIMATE_TOTAL_VALUE,
          XR.ANTICIPATED_NEED_DATE,
          XR.PACKAGE_SUBMISSION_DATE,
          XR.TOTAL_REQUESTS_AMOUNT,
          XR.EXISTING_CONTRACT_NUMBER,
          XR.EXISTING_VENDOR,
          XR.WORK_NATURE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'WORK_NATURE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.WORK_NATURE)
             WORK_NATURE_DESC,
          XR.LIFECYCLE_STATE_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'IT_LIFECYCLE_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.LIFECYCLE_STATE_TYPE)
             LIFECYCLE_STATE_TYPE_DESC,
          XR.POINT_OF_CONTACT_NAME,
          XR.POINT_OF_CONTACT_EMAIL,
          XR.POP_START_DATE,
          XR.POP_END_DATE,
          XR.ANITICIPATED_ACTION_TYPE,		  
          XR.STATEMENT_COMPLETE_FLAG,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.STATEMENT_COMPLETE_FLAG) STATEMENT_COMPLETE_FLAG_DESC,
          XR.MULTIPLE_FUND_FLAG,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.MULTIPLE_FUND_FLAG)
             MULTIPLE_FUND_FLAG_DESC,
          XR.GOVERNMENTAL_WORK_FLAG,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.GOVERNMENTAL_WORK_FLAG)
             GOVERNMENTAL_WORK_FLAG_DESC,
          XR.RECURRING_FLAG,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.RECURRING_FLAG)
             RECURRING_FLAG_DESC,
          XR.IT_PURCHASE_FLAG,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.IT_PURCHASE_FLAG)
             IT_PURCHASE_FLAG_DESC,
          XR.BTI_AC_FLAG,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.BTI_AC_FLAG)
             BTI_AC_FLAG_DESC,
          XR.CAPITALIZATION_FLAG,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.CAPITALIZATION_FLAG)
             CAPITALIZATION_FLAG_DESC,
          XR.ABOVE_OPERATING_TARGET,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.ABOVE_OPERATING_TARGET)
             ABOVE_OPERATING_TARGET_DESC,
          XR.WORKING_CAPITAL_FUND,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.WORKING_CAPITAL_FUND)
             WORKING_CAPITAL_FUND_DESC,
          XR.NEEDS_STATEMENTS_COMPLETED,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.NEEDS_STATEMENTS_COMPLETED)
             NEEDS_STATEMENTS_COMPLETED_DESC,
          XR.BIT_AC_BRIEFED_APPROVED,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.BIT_AC_BRIEFED_APPROVED)
             BIT_AC_BRIEFED_APPROVED_DESC,
          XR.INHERENTLY_GOVERNMENTAL_WORK,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'YES_NO_FLAG'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.INHERENTLY_GOVERNMENTAL_WORK)
             INHERENTLY_GOVERNMENTAL_WORK_DESC,
          XR.ISROWSELECTED,
          XR.PROCUREMENT_VEHICLE_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'PROCUREMENT_VEHICLE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.PROCUREMENT_VEHICLE_TYPE)
             PROCUREMENT_VEHICLE_TYPE_DESC,
          XR.NAICS_CODE,
          XR.PLACE_OF_PERFORMANCE,
          XR.TYPE_OF_AWARDEE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'AWARDEE_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.TYPE_OF_AWARDEE)
             TYPE_OF_AWARDEE_DESC,
          XR.CONTRACT_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'CONTRACT_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.CONTRACT_TYPE)
             CONTRACT_TYPE_DESC,
          XR.DELIVERY_ORDER_VALUE,
          XR.CURR_FY_PROJECTED_OBLIGATION,
          XR.INCUMBENT_CONTRACTOR_NAME,
          XR.ESTIMATED_AWARD_FISCAL_QUARTER,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'FISCAL_QUARTER'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.ESTIMATED_AWARD_FISCAL_QUARTER)
             FISCAL_QUARTER_DESC,
          XR.CONTRACT_STRATEGIC_GOAL,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'STRATEGIC_GOAL_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.CONTRACT_STRATEGIC_GOAL)
             CONTRACT_STRATEGIC_GOAL_DESC,
          XR.ECPIC_NUMBER,
          XR.BTIC_APPROVAL_DATE,
          XR.WORKFLOW_STATUS,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'WORKFLOW_STATUS'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XR.WORKFLOW_STATUS)
             WORKFLOW_STATUS_DESC,
          XR.APPROVED_PLAN_AMOUNT,
          XR.BUDGET_APPROVER_COMMENTS,
          XR.EBS_REQUISITION_NUM,
          XR.ATTRIBUTE1 REQ_ATTRIBUTE1,
          XR.ATTRIBUTE2 REQ_ATTRIBUTE2,
          XR.ATTRIBUTE3 REQ_ATTRIBUTE3,
          XR.ATTRIBUTE4 REQ_ATTRIBUTE4,
          XR.ATTRIBUTE5 REQ_ATTRIBUTE5,
          XR.ATTRIBUTE6 REQ_ATTRIBUTE6,
          XR.ATTRIBUTE7 REQ_ATTRIBUTE7,
          XR.ATTRIBUTE8 REQ_ATTRIBUTE8,
          XR.ATTRIBUTE9 REQ_ATTRIBUTE9,
          XR.ATTRIBUTE10 REQ_ATTRIBUTE10,
          XR.ATTRIBUTE11 REQ_ATTRIBUTE11,
          XR.ATTRIBUTE12 REQ_ATTRIBUTE12,
          XR.ATTRIBUTE13 REQ_ATTRIBUTE13,
          XR.ATTRIBUTE14 REQ_ATTRIBUTE14,
          XR.ATTRIBUTE15 REQ_ATTRIBUTE15,
          XRL.REQUEST_LINE_ID,
          XRL.LINE_DESC,
          XRL.LINE_AMOUNT,
          XRL.ATTRIBUTE1 REQ_LINE_ATTRIBUTE1,
          XRL.ATTRIBUTE2 REQ_LINE_ATTRIBUTE2,
          XRL.ATTRIBUTE3 REQ_LINE_ATTRIBUTE3,
          XRL.ATTRIBUTE4 REQ_LINE_ATTRIBUTE4,
          XRL.ATTRIBUTE5 REQ_LINE_ATTRIBUTE5,
          XRL.ATTRIBUTE6 REQ_LINE_ATTRIBUTE6,
          XRL.ATTRIBUTE7 REQ_LINE_ATTRIBUTE7,
          XRL.ATTRIBUTE8 REQ_LINE_ATTRIBUTE8,
          XRL.ATTRIBUTE9 REQ_LINE_ATTRIBUTE9,
          XRL.ATTRIBUTE10 REQ_LINE_ATTRIBUTE10,
          XRL.ATTRIBUTE11 REQ_LINE_ATTRIBUTE11,
          XRL.ATTRIBUTE12 REQ_LINE_ATTRIBUTE12,
          XRL.ATTRIBUTE13 REQ_LINE_ATTRIBUTE13,
          XRL.ATTRIBUTE14 REQ_LINE_ATTRIBUTE14,
          XRL.ATTRIBUTE15 REQ_LINE_ATTRIBUTE15,
          XRBL.BUDGET_LINE_ID,
          XRBL.FUND_PROG_CODE,
          XRBL.FUND_TYPE,
          (SELECT xlv.lookup_value_desc
             FROM xxaas_lookup_values xlv
            WHERE     xlv.lookup_name = 'FUND_TYPE'
                  AND ROWNUM = 1
                  AND xlv.lookup_value = XRbl.FUND_TYPE)
             FUND_TYPE_DESC,
          XRBL.FUND,
          XRBL.BOC_ID,
          XRBL.FUND_AMOUNT,
          XRBL.ATTRIBUTE1 REQ_BUDGET_LINE_ATTRIBUTE1,
          XRBL.ATTRIBUTE2 REQ_BUDGET_LINE_ATTRIBUTE2,
          XRBL.ATTRIBUTE3 REQ_BUDGET_LINE_ATTRIBUTE3,
          XRBL.ATTRIBUTE4 REQ_BUDGET_LINE_ATTRIBUTE4,
          XRBL.ATTRIBUTE5 REQ_BUDGET_LINE_ATTRIBUTE5,
          XRBL.ATTRIBUTE6 REQ_BUDGET_LINE_ATTRIBUTE6,
          XRBL.ATTRIBUTE7 REQ_BUDGET_LINE_ATTRIBUTE7,
          XRBL.ATTRIBUTE8 REQ_BUDGET_LINE_ATTRIBUTE8,
          XRBL.ATTRIBUTE9 REQ_BUDGET_LINE_ATTRIBUTE9,
          XRBL.ATTRIBUTE10 REQ_BUDGET_LINE_ATTRIBUTE10,
          XRBL.ATTRIBUTE11 REQ_BUDGET_LINE_ATTRIBUTE11,
          XRBL.ATTRIBUTE12 REQ_BUDGET_LINE_ATTRIBUTE12,
          XRBL.ATTRIBUTE13 REQ_BUDGET_LINE_ATTRIBUTE13,
          XRBL.ATTRIBUTE14 REQ_BUDGET_LINE_ATTRIBUTE14,
          XRBL.ATTRIBUTE15 REQ_BUDGET_LINE_ATTRIBUTE15
     FROM CLIENTS C,
          XXAAS_REQUESTS XR,
          XXAAS_REQUEST_LINES XRL,
          XXAAS_REQUEST_BUDGET_LINES XRBL
    WHERE     1 = 1
          AND c.client_id = XR.client_id
          AND c.client_id = XRL.client_id
          AND c.client_id = XRBL.client_id
          AND XR.REQUEST_ID = XRL.REQUEST_ID
          AND XR.REQUEST_ID = XRBL.REQUEST_ID
          AND XRL.REQUEST_LINE_ID = XRBL.REQUEST_LINE_ID;		


		  
CREATE OR REPLACE VIEW XXAAS_REQUEST_SUBTOWER_V
AS   
   SELECT c.CLIENT_ID,
          c.CLIENT_NAME,
          c.CLIENT_SHORT_NAME,
          XR.ORG_ID,
          (select org.org_num from xxaas_orgs org where XR.ORG_ID=org.ORG_ID) org_num,
          (select org.org_code from xxaas_orgs org where XR.ORG_ID=org.ORG_ID) org_code,
          (select org.org_num||' - '||org.org_name from xxaas_orgs org where XR.ORG_ID=org.ORG_ID) org_desc,
          XR.SUB_ORG_ID,
          (select org.org_num  from xxaas_orgs org where XR.SUB_ORG_ID=org.ORG_ID) sub_org_num,          
          (select org.org_code from xxaas_orgs org where XR.SUB_ORG_ID=org.ORG_ID) sub_org_code,
          (select org.org_num||' - '||org.org_name from xxaas_orgs org where XR.SUB_ORG_ID=org.ORG_ID) sub_org_desc,
          XR.REQUEST_ID,
          XR.REQUEST_NUMBER,
          XR.FISCAL_YEAR,
          XR.REQUEST_TYPE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='REQUEST_TYPE' and rownum=1 and xlv.lookup_value=XR.REQUEST_TYPE) REQUEST_TYPE_DESC,
          XR.PRIORITY,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PRIORITY_NO' and rownum=1 and xlv.lookup_value=XR.PRIORITY) PRIORITY_DESC, 
          XR.PROJECT_DESCRIPTION,
          XR.COMMENTS,
          XR.PROCURE_CATEGORY,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROCUREMENT_CATEGORY' and rownum=1 and xlv.lookup_value=XR.PROCURE_CATEGORY) PROCURE_CATEGORY_DESC, 
          XR.PROCURE_TYPE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROCUREMENT_TYPE' and rownum=1 and xlv.lookup_value=XR.PROCURE_TYPE) PROCURE_TYPE_DESC, 
          XR.COMPETITION_TYPE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='COMPETITION_TYPE' and rownum=1 and xlv.lookup_value=XR.COMPETITION_TYPE) COMPETITION_TYPE_DESC, 
          XR.PROPOSED_COST_TYPE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROPOSED_COST_TYPE' and rownum=1 and xlv.lookup_value=XR.PROPOSED_COST_TYPE) PROPOSED_COST_TYPE_DESC, 
          XR.PROJECTED_DURATION,
          XR.ESTIMATE_TOTAL_VALUE,
          XR.ANTICIPATED_NEED_DATE,
          XR.PACKAGE_SUBMISSION_DATE,
          XR.EXISTING_CONTRACT_NUMBER,
          XR.EXISTING_VENDOR,
          XR.WORK_NATURE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='WORK_NATURE' and rownum=1 and xlv.lookup_value=XR.WORK_NATURE) WORK_NATURE_DESC, 
          XR.LIFECYCLE_STATE_TYPE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='IT_LIFECYCLE_TYPE' and rownum=1 and xlv.lookup_value=XR.LIFECYCLE_STATE_TYPE) LIFECYCLE_STATE_TYPE_DESC, 
          XR.POINT_OF_CONTACT_NAME,
          XR.POINT_OF_CONTACT_EMAIL,
          XR.POP_START_DATE,
          XR.POP_END_DATE,
          XR.ANITICIPATED_ACTION_TYPE,
          XR.STATEMENT_COMPLETE_FLAG,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.STATEMENT_COMPLETE_FLAG) STATEMENT_COMPLETE_FLAG_DESC,          
          XR.MULTIPLE_FUND_FLAG,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.MULTIPLE_FUND_FLAG) MULTIPLE_FUND_FLAG_DESC, 
          XR.GOVERNMENTAL_WORK_FLAG,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.GOVERNMENTAL_WORK_FLAG) GOVERNMENTAL_WORK_FLAG_DESC, 
          XR.RECURRING_FLAG,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.RECURRING_FLAG) RECURRING_FLAG_DESC, 
          XR.IT_PURCHASE_FLAG,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.IT_PURCHASE_FLAG) IT_PURCHASE_FLAG_DESC, 
          XR.BTI_AC_FLAG,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.BTI_AC_FLAG) BTI_AC_FLAG_DESC, 
          XR.CAPITALIZATION_FLAG,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.CAPITALIZATION_FLAG) CAPITALIZATION_FLAG_DESC, 
          XR.ABOVE_OPERATING_TARGET,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.ABOVE_OPERATING_TARGET) ABOVE_OPERATING_TARGET_DESC, 
          XR.WORKING_CAPITAL_FUND,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.WORKING_CAPITAL_FUND) WORKING_CAPITAL_FUND_DESC, 
          XR.NEEDS_STATEMENTS_COMPLETED,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.NEEDS_STATEMENTS_COMPLETED) NEEDS_STATEMENTS_COMPLETED_DESC, 
          XR.BIT_AC_BRIEFED_APPROVED,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.BIT_AC_BRIEFED_APPROVED) BIT_AC_BRIEFED_APPROVED_DESC, 
          XR.INHERENTLY_GOVERNMENTAL_WORK,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.INHERENTLY_GOVERNMENTAL_WORK) INHERENTLY_GOVERNMENTAL_WORK_DESC, 
          XR.ISROWSELECTED,
          XR.PROCUREMENT_VEHICLE_TYPE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROCUREMENT_VEHICLE' and rownum=1 and xlv.lookup_value=XR.PROCUREMENT_VEHICLE_TYPE) PROCUREMENT_VEHICLE_TYPE_DESC, 
          XR.NAICS_CODE,
          XR.PLACE_OF_PERFORMANCE,
          XR.TYPE_OF_AWARDEE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='AWARDEE_TYPE' and rownum=1 and xlv.lookup_value=XR.TYPE_OF_AWARDEE) TYPE_OF_AWARDEE_DESC, 
          XR.CONTRACT_TYPE,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='CONTRACT_TYPE' and rownum=1 and xlv.lookup_value=XR.CONTRACT_TYPE) CONTRACT_TYPE_DESC, 
          XR.DELIVERY_ORDER_VALUE,
          XR.CURR_FY_PROJECTED_OBLIGATION,
          XR.INCUMBENT_CONTRACTOR_NAME,
          XR.ESTIMATED_AWARD_FISCAL_QUARTER,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='FISCAL_QUARTER' and rownum=1 and xlv.lookup_value=XR.ESTIMATED_AWARD_FISCAL_QUARTER) FISCAL_QUARTER_DESC, 
          XR.CONTRACT_STRATEGIC_GOAL,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='STRATEGIC_GOAL_TYPE' and rownum=1 and xlv.lookup_value=XR.CONTRACT_STRATEGIC_GOAL) CONTRACT_STRATEGIC_GOAL_DESC, 
          XR.ECPIC_NUMBER,
          XR.BTIC_APPROVAL_DATE,
          XR.WORKFLOW_STATUS,
          (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='WORKFLOW_STATUS' and rownum=1 and xlv.lookup_value=XR.WORKFLOW_STATUS) WORKFLOW_STATUS_DESC,
          XR.TOTAL_REQUESTS_AMOUNT,
          (select sum(LINE_AMOUNT) FROM XXAAS_REQUEST_LINES XRL WHERE XRL.REQUEST_ID=XR.REQUEST_ID) LINE_AMOUNT_SUM,
          XR.APPROVED_PLAN_AMOUNT ,        
          XR.BUDGET_APPROVER_COMMENTS,
          XR.EBS_REQUISITION_NUM,
          XR.ATTRIBUTE1  REQ_ATTRIBUTE1,
          XR.ATTRIBUTE2  REQ_ATTRIBUTE2,
          XR.ATTRIBUTE3  REQ_ATTRIBUTE3,
          XR.ATTRIBUTE4  REQ_ATTRIBUTE4,
          XR.ATTRIBUTE5  REQ_ATTRIBUTE5,
          XR.ATTRIBUTE6  REQ_ATTRIBUTE6,
          XR.ATTRIBUTE7  REQ_ATTRIBUTE7,
          XR.ATTRIBUTE8  REQ_ATTRIBUTE8,
          XR.ATTRIBUTE9  REQ_ATTRIBUTE9,
          XR.ATTRIBUTE10 REQ_ATTRIBUTE10,
          XR.ATTRIBUTE11 REQ_ATTRIBUTE11,
          XR.ATTRIBUTE12 REQ_ATTRIBUTE12,
          XR.ATTRIBUTE13 REQ_ATTRIBUTE13,
          XR.ATTRIBUTE14 REQ_ATTRIBUTE14,
          XR.ATTRIBUTE15 REQ_ATTRIBUTE15,
          st.sub_tower_id,
          st.sub_tower,
          st.percentage,
          st.attribute1 SUB_TOWER_ATTRIBUTE1,
          st.attribute2 SUB_TOWER_ATTRIBUTE2,
          st.attribute3 SUB_TOWER_ATTRIBUTE3,
          st.attribute4 SUB_TOWER_ATTRIBUTE4,
          st.attribute5 SUB_TOWER_ATTRIBUTE5,
          st.attribute6 SUB_TOWER_ATTRIBUTE6,
          st.attribute7 SUB_TOWER_ATTRIBUTE7,
          st.attribute8 SUB_TOWER_ATTRIBUTE8,
          st.attribute9 SUB_TOWER_ATTRIBUTE9,
          st.attribute1 SUB_TOWER_ATTRIBUTE10,
          st.attribute11 SUB_TOWER_ATTRIBUTE11,
          st.attribute12 SUB_TOWER_ATTRIBUTE12,
          st.attribute13 SUB_TOWER_ATTRIBUTE13,
          st.attribute14 SUB_TOWER_ATTRIBUTE14,
          st.attribute15 SUB_TOWER_ATTRIBUTE15
     FROM CLIENTS C,
          XXAAS_REQUESTS XR,
          XXAAS_REQUEST_SUB_TOWERS ST
    WHERE     1 = 1
          AND c.client_id         = XR.client_id
          AND ST.client_id    = c.client_id
          AND ST.REQUEST_ID         = XR.REQUEST_ID;

CREATE OR REPLACE VIEW XXAAS_REQUEST_V
AS   
   SELECT c.CLIENT_ID,
          c.CLIENT_NAME,
          c.CLIENT_SHORT_NAME,
          XR.ORG_ID,
		  (select org.org_num||' - '||org.org_name from xxaas_orgs org where XR.ORG_ID=org.ORG_ID) org_desc,
          XR.SUB_ORG_ID,
		  (select org.org_num||' - '||org.org_name from xxaas_orgs org where XR.SUB_ORG_ID=org.ORG_ID) sub_org_desc,
          XR.REQUEST_ID,
          XR.REQUEST_NUMBER,
          XR.FISCAL_YEAR,
          XR.REQUEST_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='REQUEST_TYPE' and rownum=1 and xlv.lookup_value=XR.REQUEST_TYPE) REQUEST_TYPE_DESC,
          XR.PRIORITY,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PRIORITY_NO' and rownum=1 and xlv.lookup_value=XR.PRIORITY) PRIORITY_DESC, 
          XR.PROJECT_DESCRIPTION,
          XR.COMMENTS,
          XR.PROCURE_CATEGORY,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROCUREMENT_CATEGORY' and rownum=1 and xlv.lookup_value=XR.PROCURE_CATEGORY) PROCURE_CATEGORY_DESC, 
          XR.PROCURE_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROCUREMENT_TYPE' and rownum=1 and xlv.lookup_value=XR.PROCURE_TYPE) PROCURE_TYPE_DESC, 
          XR.COMPETITION_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='COMPETITION_TYPE' and rownum=1 and xlv.lookup_value=XR.COMPETITION_TYPE) COMPETITION_TYPE_DESC, 
          XR.PROPOSED_COST_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROPOSED_COST_TYPE' and rownum=1 and xlv.lookup_value=XR.PROPOSED_COST_TYPE) PROPOSED_COST_TYPE_DESC, 
          XR.PROJECTED_DURATION,
          XR.ESTIMATE_TOTAL_VALUE,
          XR.ANTICIPATED_NEED_DATE,
          XR.PACKAGE_SUBMISSION_DATE,
          XR.TOTAL_REQUESTS_AMOUNT,
          XR.EXISTING_CONTRACT_NUMBER,
          XR.EXISTING_VENDOR,
          XR.WORK_NATURE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='WORK_NATURE' and rownum=1 and xlv.lookup_value=XR.WORK_NATURE) WORK_NATURE_DESC, 
          XR.LIFECYCLE_STATE_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='IT_LIFECYCLE_TYPE' and rownum=1 and xlv.lookup_value=XR.LIFECYCLE_STATE_TYPE) LIFECYCLE_STATE_TYPE_DESC, 
          XR.STATEMENT_COMPLETE_FLAG,
          XR.POINT_OF_CONTACT_NAME,
          XR.POINT_OF_CONTACT_EMAIL,
          XR.POP_START_DATE,
          XR.POP_END_DATE,
          XR.ANITICIPATED_ACTION_TYPE,
          XR.MULTIPLE_FUND_FLAG,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.MULTIPLE_FUND_FLAG) MULTIPLE_FUND_FLAG_DESC, 
          XR.GOVERNMENTAL_WORK_FLAG,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.GOVERNMENTAL_WORK_FLAG) GOVERNMENTAL_WORK_FLAG_DESC, 
          XR.RECURRING_FLAG,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.RECURRING_FLAG) RECURRING_FLAG_DESC, 
          XR.IT_PURCHASE_FLAG,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.IT_PURCHASE_FLAG) IT_PURCHASE_FLAG_DESC, 
          XR.BTI_AC_FLAG,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.BTI_AC_FLAG) BTI_AC_FLAG_DESC, 
          XR.CAPITALIZATION_FLAG,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.CAPITALIZATION_FLAG) CAPITALIZATION_FLAG_DESC, 
          XR.ABOVE_OPERATING_TARGET,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.ABOVE_OPERATING_TARGET) ABOVE_OPERATING_TARGET_DESC, 
          XR.WORKING_CAPITAL_FUND,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.WORKING_CAPITAL_FUND) WORKING_CAPITAL_FUND_DESC, 
          XR.NEEDS_STATEMENTS_COMPLETED,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.NEEDS_STATEMENTS_COMPLETED) NEEDS_STATEMENTS_COMPLETED_DESC, 
          XR.BIT_AC_BRIEFED_APPROVED,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.BIT_AC_BRIEFED_APPROVED) BIT_AC_BRIEFED_APPROVED_DESC, 
          XR.INHERENTLY_GOVERNMENTAL_WORK,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='YES_NO_FLAG' and rownum=1 and xlv.lookup_value=XR.INHERENTLY_GOVERNMENTAL_WORK) INHERENTLY_GOVERNMENTAL_WORK_DESC, 
          XR.ISROWSELECTED,
          XR.PROCUREMENT_VEHICLE_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='PROCUREMENT_VEHICLE' and rownum=1 and xlv.lookup_value=XR.PROCUREMENT_VEHICLE_TYPE) PROCUREMENT_VEHICLE_TYPE_DESC, 
          XR.NAICS_CODE,
          XR.PLACE_OF_PERFORMANCE,
          XR.TYPE_OF_AWARDEE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='AWARDEE_TYPE' and rownum=1 and xlv.lookup_value=XR.TYPE_OF_AWARDEE) TYPE_OF_AWARDEE_DESC, 
          XR.CONTRACT_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='CONTRACT_TYPE' and rownum=1 and xlv.lookup_value=XR.CONTRACT_TYPE) CONTRACT_TYPE_DESC, 
          XR.DELIVERY_ORDER_VALUE,
          XR.CURR_FY_PROJECTED_OBLIGATION,
          XR.INCUMBENT_CONTRACTOR_NAME,
          XR.ESTIMATED_AWARD_FISCAL_QUARTER,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='FISCAL_QUARTER' and rownum=1 and xlv.lookup_value=XR.ESTIMATED_AWARD_FISCAL_QUARTER) FISCAL_QUARTER_DESC, 
          XR.CONTRACT_STRATEGIC_GOAL,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='STRATEGIC_GOAL_TYPE' and rownum=1 and xlv.lookup_value=XR.CONTRACT_STRATEGIC_GOAL) CONTRACT_STRATEGIC_GOAL_DESC, 
          XR.ECPIC_NUMBER,
          XR.BTIC_APPROVAL_DATE,
          XR.WORKFLOW_STATUS,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='WORKFLOW_STATUS' and rownum=1 and xlv.lookup_value=XR.WORKFLOW_STATUS) WORKFLOW_STATUS_DESC, 
          XR.APPROVED_PLAN_AMOUNT,
          XR.BUDGET_APPROVER_COMMENTS,
          XR.EBS_REQUISITION_NUM,
          XR.ATTRIBUTE1  REQ_ATTRIBUTE1,
          XR.ATTRIBUTE2  REQ_ATTRIBUTE2,
          XR.ATTRIBUTE3  REQ_ATTRIBUTE3,
          XR.ATTRIBUTE4  REQ_ATTRIBUTE4,
          XR.ATTRIBUTE5  REQ_ATTRIBUTE5,
          XR.ATTRIBUTE6  REQ_ATTRIBUTE6,
          XR.ATTRIBUTE7  REQ_ATTRIBUTE7,
          XR.ATTRIBUTE8  REQ_ATTRIBUTE8,
          XR.ATTRIBUTE9  REQ_ATTRIBUTE9,
          XR.ATTRIBUTE10 REQ_ATTRIBUTE10,
          XR.ATTRIBUTE11 REQ_ATTRIBUTE11,
          XR.ATTRIBUTE12 REQ_ATTRIBUTE12,
          XR.ATTRIBUTE13 REQ_ATTRIBUTE13,
          XR.ATTRIBUTE14 REQ_ATTRIBUTE14,
          XR.ATTRIBUTE15 REQ_ATTRIBUTE15,
          XRL.REQUEST_LINE_ID,
          XRL.LINE_DESC,
          XRL.LINE_AMOUNT,
          XRL.ATTRIBUTE1  REQ_LINE_ATTRIBUTE1,
          XRL.ATTRIBUTE2  REQ_LINE_ATTRIBUTE2,
          XRL.ATTRIBUTE3  REQ_LINE_ATTRIBUTE3,
          XRL.ATTRIBUTE4  REQ_LINE_ATTRIBUTE4,
          XRL.ATTRIBUTE5  REQ_LINE_ATTRIBUTE5,
          XRL.ATTRIBUTE6  REQ_LINE_ATTRIBUTE6,
          XRL.ATTRIBUTE7  REQ_LINE_ATTRIBUTE7,
          XRL.ATTRIBUTE8  REQ_LINE_ATTRIBUTE8,
          XRL.ATTRIBUTE9  REQ_LINE_ATTRIBUTE9,
          XRL.ATTRIBUTE10 REQ_LINE_ATTRIBUTE10,
          XRL.ATTRIBUTE11 REQ_LINE_ATTRIBUTE11,
          XRL.ATTRIBUTE12 REQ_LINE_ATTRIBUTE12,
          XRL.ATTRIBUTE13 REQ_LINE_ATTRIBUTE13,
          XRL.ATTRIBUTE14 REQ_LINE_ATTRIBUTE14,
          XRL.ATTRIBUTE15 REQ_LINE_ATTRIBUTE15,
          XRBL.BUDGET_LINE_ID,
          XRBL.FUND_PROG_CODE,
          XRBL.FUND_TYPE,
		  (select xlv.lookup_value_desc from xxaas_lookup_values xlv where xlv.lookup_name ='FUND_TYPE' and rownum=1 and xlv.lookup_value=XRbl.FUND_TYPE) FUND_TYPE_DESC, 
          XRBL.FUND,
          XRBL.BOC_ID,
          XRBL.FUND_AMOUNT,
          XRBL.ATTRIBUTE1  REQ_BUDGET_LINE_ATTRIBUTE1,
          XRBL.ATTRIBUTE2  REQ_BUDGET_LINE_ATTRIBUTE2,
          XRBL.ATTRIBUTE3  REQ_BUDGET_LINE_ATTRIBUTE3,
          XRBL.ATTRIBUTE4  REQ_BUDGET_LINE_ATTRIBUTE4,
          XRBL.ATTRIBUTE5  REQ_BUDGET_LINE_ATTRIBUTE5,
          XRBL.ATTRIBUTE6  REQ_BUDGET_LINE_ATTRIBUTE6,
          XRBL.ATTRIBUTE7  REQ_BUDGET_LINE_ATTRIBUTE7,
          XRBL.ATTRIBUTE8  REQ_BUDGET_LINE_ATTRIBUTE8,
          XRBL.ATTRIBUTE9  REQ_BUDGET_LINE_ATTRIBUTE9,
          XRBL.ATTRIBUTE10 REQ_BUDGET_LINE_ATTRIBUTE10,
          XRBL.ATTRIBUTE11 REQ_BUDGET_LINE_ATTRIBUTE11,
          XRBL.ATTRIBUTE12 REQ_BUDGET_LINE_ATTRIBUTE12,
          XRBL.ATTRIBUTE13 REQ_BUDGET_LINE_ATTRIBUTE13,
          XRBL.ATTRIBUTE14 REQ_BUDGET_LINE_ATTRIBUTE14,
          XRBL.ATTRIBUTE15 REQ_BUDGET_LINE_ATTRIBUTE15,
          st.sub_tower_id,
          st.sub_tower,
          st.percentage,
          st.attribute1 SUB_TOWER_ATTRIBUTE1,
          st.attribute2 SUB_TOWER_ATTRIBUTE2,
          st.attribute3 SUB_TOWER_ATTRIBUTE3,
          st.attribute4 SUB_TOWER_ATTRIBUTE4,
          st.attribute5 SUB_TOWER_ATTRIBUTE5,
          st.attribute6 SUB_TOWER_ATTRIBUTE6,
          st.attribute7 SUB_TOWER_ATTRIBUTE7,
          st.attribute8 SUB_TOWER_ATTRIBUTE8,
          st.attribute9 SUB_TOWER_ATTRIBUTE9,
          st.attribute1 SUB_TOWER_ATTRIBUTE10,
          st.attribute11 SUB_TOWER_ATTRIBUTE11,
          st.attribute12 SUB_TOWER_ATTRIBUTE12,
          st.attribute13 SUB_TOWER_ATTRIBUTE13,
          st.attribute14 SUB_TOWER_ATTRIBUTE14,
          st.attribute15 SUB_TOWER_ATTRIBUTE15,
          rf.file_id,
          rf.file_name,
          rf.file_extension,
          rf.file_blob,
          rf.attribute1 FILE_ATTRIBUTE1,
          rf.attribute2 FILE_ATTRIBUTE2,
          rf.attribute3 FILE_ATTRIBUTE3,
          rf.attribute4 FILE_ATTRIBUTE4,
          rf.attribute5 FILE_ATTRIBUTE5,
          rf.attribute6 FILE_ATTRIBUTE6,
          rf.attribute7 FILE_ATTRIBUTE7,
          rf.attribute8 FILE_ATTRIBUTE8,
          rf.attribute9 FILE_ATTRIBUTE9,
          rf.attribute1 FILE_ATTRIBUTE10,
          rf.attribute11 FILE_ATTRIBUTE11,
          rf.attribute12 FILE_ATTRIBUTE12,
          rf.attribute13 FILE_ATTRIBUTE13,
          rf.attribute14 FILE_ATTRIBUTE14,
          rf.attribute15 FILE_ATTRIBUTE15
     FROM CLIENTS C,
          XXAAS_REQUESTS XR,
          XXAAS_REQUEST_LINES XRL,
          XXAAS_REQUEST_BUDGET_LINES XRBL,
          XXAAS_REQUEST_SUB_TOWERS ST,
          XXAAS_REQUEST_files RF
    WHERE     1 = 1
          AND c.client_id = XR.client_id
          AND c.client_id = st.client_id(+)
          AND c.client_id = rf.client_id(+)
          AND c.client_id = XRL.client_id
          AND c.client_id = XRBL.client_id
          AND xr.request_id = st.request_id(+)
          AND xr.request_id = rf.request_id(+)
          AND XR.REQUEST_ID = XRL.REQUEST_ID
          AND XR.REQUEST_ID = XRBL.REQUEST_ID
          AND XRL.REQUEST_LINE_ID = XRBL.REQUEST_LINE_ID;

