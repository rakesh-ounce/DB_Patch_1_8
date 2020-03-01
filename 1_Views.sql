/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- 1. View for distribution group details information
        
--- Tables used:         
        
        XXAAS_USERS 
        DISTRIBUTION_GROUPS 
        DISTRIBUTION_GROUP_DETAILS 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE OR REPLACE  VIEW DISTRIBUTION_GROUP_V
AS
   SELECT DG.CLIENT_ID,
          DG.DIST_GROUP_ID,
          DG.GROUP_NAME,
          DG.Description,
          DG.END_DATE DIST_GROUP_END_DATE,
          DG.ATTRIBUTE1 DIST_GROUP_ATTRIBUTE1,
          DG.ATTRIBUTE2 DIST_GROUP_ATTRIBUTE2,
          DG.ATTRIBUTE3 DIST_GROUP_ATTRIBUTE3,
          DG.ATTRIBUTE4 DIST_GROUP_ATTRIBUTE4,
          DG.ATTRIBUTE5 DIST_GROUP_ATTRIBUTE5,
          DG.ATTRIBUTE6 DIST_GROUP_ATTRIBUTE6,
          DG.ATTRIBUTE7 DIST_GROUP_ATTRIBUTE7,
          DG.ATTRIBUTE8 DIST_GROUP_ATTRIBUTE8,
          DG.ATTRIBUTE9 DIST_GROUP_ATTRIBUTE9,
          DG.ATTRIBUTE10 DIST_GROUP_ATTRIBUTE10,
          DG.ATTRIBUTE11 DIST_GROUP_ATTRIBUTE11,
          DG.ATTRIBUTE12 DIST_GROUP_ATTRIBUTE12,
          DG.ATTRIBUTE13 DIST_GROUP_ATTRIBUTE13,
          DG.ATTRIBUTE14 DIST_GROUP_ATTRIBUTE14,
          DG.ATTRIBUTE15 DIST_GROUP_ATTRIBUTE15,
          DGD.DIST_GROUP_DETAIL_ID,
          DGD.END_DATE DIST_GROUP_DETAIL_END_DATE,
          DGD.ATTRIBUTE1 DIST_GROUP_DETAIL_ATTRIBUTE1,
          DGD.ATTRIBUTE2 DIST_GROUP_DETAIL_ATTRIBUTE2,
          DGD.ATTRIBUTE3 DIST_GROUP_DETAIL_ATTRIBUTE3,
          DGD.ATTRIBUTE4 DIST_GROUP_DETAIL_ATTRIBUTE4,
          DGD.ATTRIBUTE5 DIST_GROUP_DETAIL_ATTRIBUTE5,
          DGD.ATTRIBUTE6 DIST_GROUP_DETAIL_ATTRIBUTE6,
          DGD.ATTRIBUTE7 DIST_GROUP_DETAIL_ATTRIBUTE7,
          DGD.ATTRIBUTE8 DIST_GROUP_DETAIL_ATTRIBUTE8,
          DGD.ATTRIBUTE9 DIST_GROUP_DETAIL_ATTRIBUTE9,
          DGD.ATTRIBUTE10 DIST_GROUP_DETAIL_ATTRIBUTE10,
          DGD.ATTRIBUTE11 DIST_GROUP_DETAIL_ATTRIBUTE11,
          DGD.ATTRIBUTE12 DIST_GROUP_DETAIL_ATTRIBUTE12,
          DGD.ATTRIBUTE13 DIST_GROUP_DETAIL_ATTRIBUTE13,
          DGD.ATTRIBUTE14 DIST_GROUP_DETAIL_ATTRIBUTE14,
          DGD.ATTRIBUTE15 DIST_GROUP_DETAIL_ATTRIBUTE15,
          XODG.ORG_DIST_GROUP_ID,
          XODG.DEFAULT_EMAIL_ADDRESS,
          XODG.END_DATE ORG_DIST_GROUP_END_DATE,
          XODG.ATTRIBUTE1 ORG_DIST_GROUP_ATTRIBUTE1,
          XODG.ATTRIBUTE2 ORG_DIST_GROUP_ATTRIBUTE2,
          XODG.ATTRIBUTE3 ORG_DIST_GROUP_ATTRIBUTE3,
          XODG.ATTRIBUTE4 ORG_DIST_GROUP_ATTRIBUTE4,
          XODG.ATTRIBUTE5 ORG_DIST_GROUP_ATTRIBUTE5,
          XODG.ATTRIBUTE6 ORG_DIST_GROUP_ATTRIBUTE6,
          XODG.ATTRIBUTE7 ORG_DIST_GROUP_ATTRIBUTE7,
          XODG.ATTRIBUTE8 ORG_DIST_GROUP_ATTRIBUTE8,
          XODG.ATTRIBUTE9 ORG_DIST_GROUP_ATTRIBUTE9,
          XODG.ATTRIBUTE10 ORG_DIST_GROUP_ATTRIBUTE10,
          XODG.ATTRIBUTE11 ORG_DIST_GROUP_ATTRIBUTE11,
          XODG.ATTRIBUTE12 ORG_DIST_GROUP_ATTRIBUTE12,
          XODG.ATTRIBUTE13 ORG_DIST_GROUP_ATTRIBUTE13,
          XODG.ATTRIBUTE14 ORG_DIST_GROUP_ATTRIBUTE14,
          XODG.ATTRIBUTE15 ORG_DIST_GROUP_ATTRIBUTE15,
          XU.USER_ID AAS_USER_ID,
          XU.GLOBAL_USER_ID USER_ID,
          XU.USER_NAME,
          XU.FIRST_NAME,
          XU.MIDDLE_NAME,
          XU.LAST_NAME,
          XU.EMAIL,
          XU.EMAIL_FLAG,
          XU.ADMIN_FLAG,
          XU.END_DATE USER_END_DATE,
          XU.PASSWORD,
          XU.Attribute1 USER_Attribute1,
          XU.Attribute2 USER_Attribute2,
          XU.Attribute3 USER_Attribute3,
          XU.Attribute4 USER_Attribute4,
          XU.Attribute5 USER_Attribute5,
          XU.Attribute6 USER_Attribute6,
          XU.Attribute7 USER_Attribute7,
          XU.Attribute8 USER_Attribute8,
          XU.Attribute9 USER_Attribute9,
          XU.Attribute10 USER_Attribute10,
          XU.Attribute11 USER_Attribute11,
          XU.Attribute12 USER_Attribute12,
          XU.Attribute13 USER_Attribute13,
          XU.Attribute14 USER_Attribute14,
          XU.Attribute15 USER_Attribute15,
          XO.ORG_ID,
          XO.ORG_NUM,
          XO.ORG_CODE,
          XO.ORG_NAME,
          XO.ORG_DESCRIPTION,
          XO.END_DATE ORG_END_DATE,
          XO.PARENT_ORG_ID,
          XO.SOURCE_ORG_ID,
          XO.Attribute1 ORG_Attribute1,
          XO.Attribute2 ORG_Attribute2,
          XO.Attribute3 ORG_Attribute3,
          XO.Attribute4 ORG_Attribute4,
          XO.Attribute5 ORG_Attribute5,
          XO.Attribute6 ORG_Attribute6,
          XO.Attribute7 ORG_Attribute7,
          XO.Attribute8 ORG_Attribute8,
          XO.Attribute9 ORG_Attribute9,
          XO.Attribute10 ORG_Attribute10,
          XO.Attribute11 ORG_Attribute11,
          XO.Attribute12 ORG_Attribute12,
          XO.Attribute13 ORG_Attribute13,
          XO.Attribute14 ORG_Attribute14,
          XO.Attribute15 ORG_Attribute15
     FROM DISTRIBUTION_GROUPS DG,
          DISTRIBUTION_GROUP_DETAILS DGD,
          XXAAS_ORG_DIST_GROUPS XODG,
          XXAAS_USERS XU,
          XXAAS_ORGS XO
    WHERE     1 = 1
          AND DG.CLIENT_ID = DGD.CLIENT_ID
          AND DG.CLIENT_ID = XODG.CLIENT_ID
          AND DG.CLIENT_ID = XU.CLIENT_ID
          AND DG.CLIENT_ID = XO.CLIENT_ID
          AND DG.DIST_GROUP_ID = DGD.DIST_GROUP_ID
          AND DG.DIST_GROUP_ID = XODG.DIST_GROUP_ID
          AND XU.GLOBAL_USER_ID = DGD.USER_ID
          AND XO.ORG_ID = XODG.ORG_ID
          AND NVL (trunc(DG.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(DGD.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(XODG.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(XU.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(XO.END_DATE), SYSDATE) >= SYSDATE;





  CREATE OR REPLACE   VIEW "RULES_V"  AS 
  SELECT ovg.ORG_VALIDATION_GROUP_ID||'-'||vrg.group_detail_id||'-'||vg.group_id||'-'||vr.rule_id unique_key,
          c.CLIENT_ID,
          c.CLIENT_NAME,
          c.CLIENT_SHORT_NAME,
          app.APPLICATION_ID,
          app.APPLICATION_NAME,
          app.DESCRIPTION APP_DESC,
          app.APPLICATION_URL,
          app.APPLICATION_ICON,
          app.END_DATE APP_END_DATE,
          app.Attribute1  APP_Attribute1,
          app.Attribute2  APP_Attribute2,
          app.Attribute3  APP_Attribute3,
          app.Attribute4  APP_Attribute4,
          app.Attribute5  APP_Attribute5,
          app.Attribute6  APP_Attribute6,
          app.Attribute7  APP_Attribute7,
          app.Attribute8  APP_Attribute8,
          app.Attribute9  APP_Attribute9,
          app.Attribute10 APP_Attribute10,
          app.Attribute11 APP_Attribute11,
          app.Attribute12 APP_Attribute12,
          app.Attribute13 APP_Attribute13,
          app.Attribute14 APP_Attribute14,
          app.Attribute15 APP_Attribute15,
         vr.RULE_ID,
          vr.RULE_NAME,
          vr.PROCEDURE_NAME,
          vr.PROCEDURE_TYPE,
          vr.DESCRIPTION VAL_RUL_DESC,
          vr.COMMENTS VAL_RUL_COMMENTS,
          vr.SUCCESS_MSG_ID,
          vr.ERROR_MSG_ID,
          vr.END_DATE VAL_RUL_END_DATE,
          vr.Attribute1 VAL_RUL_Attribute1,
          vr.Attribute2 VAL_RUL_Attribute2,
          vr.Attribute3 VAL_RUL_Attribute3,
          vr.Attribute4 VAL_RUL_Attribute4,
          vr.Attribute5 VAL_RUL_Attribute5,
          vr.Attribute6 VAL_RUL_Attribute6,
          vr.Attribute7 VAL_RUL_Attribute7,
          vr.Attribute8 VAL_RUL_Attribute8,
          vr.Attribute9 VAL_RUL_Attribute9,
          vr.Attribute10 VAL_RUL_Attribute10,
          vr.Attribute11 VAL_RUL_Attribute11,
          vr.Attribute12 VAL_RUL_Attribute12,
          vr.Attribute13 VAL_RUL_Attribute13,
          vr.Attribute14 VAL_RUL_Attribute14,
          vr.Attribute15 VAL_RUL_Attribute15,
          vg.GROUP_ID,
          vg.GROUP_NAME,
          vg.DESCRIPTION VAL_GR_DESC,
          vg.COMMENTS VAL_GR_COMMENTS,
          vg.END_DATE VAL_GR_END_DATE,
          vg.Attribute1 VAL_GR_Attribute1,
          vg.Attribute2 VAL_GR_Attribute2,
          vg.Attribute3 VAL_GR_Attribute3,
          vg.Attribute4 VAL_GR_Attribute4,
          vg.Attribute5 VAL_GR_Attribute5,
          vg.Attribute6 VAL_GR_Attribute6,
          vg.Attribute7 VAL_GR_Attribute7,
          vg.Attribute8 VAL_GR_Attribute8,
          vg.Attribute9 VAL_GR_Attribute9,
          vg.Attribute10 VAL_GR_Attribute10,
          vg.Attribute11 VAL_GR_Attribute11,
          vg.Attribute12 VAL_GR_Attribute12,
          vg.Attribute13 VAL_GR_Attribute13,
          vg.Attribute14 VAL_GR_Attribute14,
          vg.Attribute15 VAL_GR_Attribute15,
          vrg.GROUP_DETAIL_ID,
          vrg.PROCESSING_ORDER,
          vrg.END_DATE VAL_RUL_GRP_END_DATE,
          vrg.Attribute1 VAL_RUL_GRP_Attribute1,
          vrg.Attribute2 VAL_RUL_GRP_Attribute2,
          vrg.Attribute3 VAL_RUL_GRP_Attribute3,
          vrg.Attribute4 VAL_RUL_GRP_Attribute4,
          vrg.Attribute5 VAL_RUL_GRP_Attribute5,
          vrg.Attribute6 VAL_RUL_GRP_Attribute6,
          vrg.Attribute7 VAL_RUL_GRP_Attribute7,
          vrg.Attribute8 VAL_RUL_GRP_Attribute8,
          vrg.Attribute9 VAL_RUL_GRP_Attribute9,
          vrg.Attribute10 VAL_RUL_GRP_Attribute10,
          vrg.Attribute11 VAL_RUL_GRP_Attribute11,
          vrg.Attribute12 VAL_RUL_GRP_Attribute12,
          vrg.Attribute13 VAL_RUL_GRP_Attribute13,
          vrg.Attribute14 VAL_RUL_GRP_Attribute14,
          vrg.Attribute15 VAL_RUL_GRP_Attribute15,
          msg1.MESSAGE_NAME SUCCESS_MESAGE_NAME,
          msg1.DESCRIPTION SUCCESS_MESAGE_DESC,
          msg1.MESSAGE_TEXT SUCCESS_MESAGE_TEXT,
          msg1.END_DATE SUCCESS_MESAGE_END_DATE,
          msg1.Attribute1 SUCCESS_MESAGE_Attribute1,
          msg1.Attribute2 SUCCESS_MESAGE_Attribute2,
          msg1.Attribute3 SUCCESS_MESAGE_Attribute3,
          msg1.Attribute4 SUCCESS_MESAGE_Attribute4,
          msg1.Attribute5 SUCCESS_MESAGE_Attribute5,
          msg1.Attribute6 SUCCESS_MESAGE_Attribute6,
          msg1.Attribute7 SUCCESS_MESAGE_Attribute7,
          msg1.Attribute8 SUCCESS_MESAGE_Attribute8,
          msg1.Attribute9 SUCCESS_MESAGE_Attribute9,
          msg1.Attribute10 SUCCESS_MESAGE_Attribute10,
          msg1.Attribute11 SUCCESS_MESAGE_Attribute11,
          msg1.Attribute12 SUCCESS_MESAGE_Attribute12,
          msg1.Attribute13 SUCCESS_MESAGE_Attribute13,
          msg1.Attribute14 SUCCESS_MESAGE_Attribute14,
          msg1.Attribute15 SUCCESS_MESAGE_Attribute15,
          msg2.MESSAGE_NAME ERROR_MESAGE_NAME,
          msg2.DESCRIPTION ERROR_MESAGE_DESC,
          msg2.MESSAGE_TEXT ERROR_MESAGE_TEXT,
          msg2.END_DATE ERROR_MESAGE_END_DATE,
          msg2.Attribute1 ERROR_MESAGE_Attribute1,
          msg2.Attribute2 ERROR_MESAGE_Attribute2,
          msg2.Attribute3 ERROR_MESAGE_Attribute3,
          msg2.Attribute4 ERROR_MESAGE_Attribute4,
          msg2.Attribute5 ERROR_MESAGE_Attribute5,
          msg2.Attribute6 ERROR_MESAGE_Attribute6,
          msg2.Attribute7 ERROR_MESAGE_Attribute7,
          msg2.Attribute8 ERROR_MESAGE_Attribute8,
          msg2.Attribute9 ERROR_MESAGE_Attribute9,
          msg2.Attribute10 ERROR_MESAGE_Attribute10,
          msg2.Attribute11 ERROR_MESAGE_Attribute11,
          msg2.Attribute12 ERROR_MESAGE_Attribute12,
          msg2.Attribute13 ERROR_MESAGE_Attribute13,
          msg2.Attribute14 ERROR_MESAGE_Attribute14,
          msg2.Attribute15 ERROR_MESAGE_Attribute15,
          OVG.ORG_VALIDATION_GROUP_ID,
          OVG.PRIORITY,
                                OVG.fiscal_year,
          OVG.END_DATE ORG_VAL_GROUP_END_DATE,
          OVG.ATTRIBUTE1  ORG_VAL_GRP_ATTRIBUTE1,
          OVG.ATTRIBUTE2  ORG_VAL_GRP_ATTRIBUTE2,
          OVG.ATTRIBUTE3  ORG_VAL_GRP_ATTRIBUTE3,
          OVG.ATTRIBUTE4  ORG_VAL_GRP_ATTRIBUTE4,
          OVG.ATTRIBUTE5  ORG_VAL_GRP_ATTRIBUTE5,
          OVG.ATTRIBUTE6  ORG_VAL_GRP_ATTRIBUTE6,
          OVG.ATTRIBUTE7  ORG_VAL_GRP_ATTRIBUTE7,
          OVG.ATTRIBUTE8  ORG_VAL_GRP_ATTRIBUTE8,
          OVG.ATTRIBUTE9  ORG_VAL_GRP_ATTRIBUTE9,
          OVG.ATTRIBUTE10 ORG_VAL_GRP_ATTRIBUTE10,
          OVG.ATTRIBUTE11 ORG_VAL_GRP_ATTRIBUTE11,
          OVG.ATTRIBUTE12 ORG_VAL_GRP_ATTRIBUTE12,
          OVG.ATTRIBUTE13 ORG_VAL_GRP_ATTRIBUTE13,
          OVG.ATTRIBUTE14 ORG_VAL_GRP_ATTRIBUTE14,
          OVG.ATTRIBUTE15 ORG_VAL_GRP_ATTRIBUTE15,
          xo.ORG_ID,
            xo.ORG_NUM,
            xo.ORG_CODE,
            xo.ORG_NAME,
            xo.ORG_DESCRIPTION,
            xo.PARENT_ORG_ID,
            xo.SOURCE_ORG_ID,
            LEVEL org_level,
            CONNECT_BY_ROOT xo.org_id TOP_ORG_ID,
            DECODE (LEVEL, 1, 'Parent Org', 'Sub-Org') ORG_TYPE,
            xo.ATTRIBUTE1 ORG_ATTRIBUTE1,
            xo.ATTRIBUTE2 ORG_ATTRIBUTE2,
            xo.ATTRIBUTE3 ORG_ATTRIBUTE3,
            xo.ATTRIBUTE4 ORG_ATTRIBUTE4,
            xo.ATTRIBUTE5 ORG_ATTRIBUTE5,
            xo.ATTRIBUTE6 ORG_ATTRIBUTE6,
            xo.ATTRIBUTE7 ORG_ATTRIBUTE7,
            xo.ATTRIBUTE8 ORG_ATTRIBUTE8,
            xo.ATTRIBUTE9 ORG_ATTRIBUTE9,
            xo.ATTRIBUTE10 ORG_ATTRIBUTE10,
            xo.ATTRIBUTE11 ORG_ATTRIBUTE11,
            xo.ATTRIBUTE12 ORG_ATTRIBUTE12,
            xo.ATTRIBUTE13 ORG_ATTRIBUTE13,
            xo.ATTRIBUTE14 ORG_ATTRIBUTE14,
            xo.ATTRIBUTE15 ORG_ATTRIBUTE15,
            xo.END_DATE ORG_END_DATE
     FROM CLIENTS c,
          APPLICATIONS app,
          VALIDATION_RULES vr,
          VALIDATION_GROUPS vg,
          VALIDATION_GROUP_DETAILS vrg,
          MESSAGES msg1,
          MESSAGES msg2,
          ORG_VALIDATION_GROUPS OVG,
          xxaas_orgs xo
    WHERE     1=1
          AND xo.org_id = ovg.org_id
          AND c.client_id = app.client_id
          AND c.client_id = vr.client_id
          AND C.CLIENT_ID = OVG.CLIENT_ID
          AND OVG.GROUP_ID = VG.GROUP_ID
          and OVG.APPLICATION_ID = app.application_id
          AND c.client_id = vg.client_id
          AND c.client_id = vrg.client_id
          AND c.client_id = msg1.client_id
          AND c.client_id = msg2.client_id
          AND app.application_id = vr.application_id
          AND vr.application_id = vrg.application_id
          AND vr.application_id = vg.application_id
          AND vr.application_id = msg1.application_id
          AND vr.application_id = msg2.application_id
          AND vr.SUCCESS_MSG_ID = msg1.MESSAGE_ID(+)
          AND vr.ERROR_MSG_ID = msg2.MESSAGE_ID(+)
          AND vg.GROUP_ID = vrg.GROUP_ID
          AND vr.rule_id = vrg.rule_id
          CONNECT BY PRIOR xo.org_id = xo.parent_org_id
          START WITH xo.parent_org_id = 0
          AND NVL (trunc(app.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(vr.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(vg.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(vrg.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(ovg.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(msg1.END_DATE), SYSDATE) >= SYSDATE
          AND NVL (trunc(msg2.END_DATE), SYSDATE) >= SYSDATE;
