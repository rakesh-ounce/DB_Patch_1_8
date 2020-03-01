CREATE TABLE XXAAS_ORGS
(
   CLIENT_ID          NUMBER NOT NULL,
   ORG_ID             NUMBER PRIMARY KEY,
   ORG_NUM            NUMBER UNIQUE NOT NULL,
   ORG_CODE           VARCHAR2 (50 BYTE) NOT NULL,
   ORG_NAME           VARCHAR2 (500 BYTE) UNIQUE NOT NULL,
   ORG_DESCRIPTION    VARCHAR2 (500 BYTE) NOT NULL,
   PARENT_ORG_ID      NUMBER DEFAULT 0,
   SOURCE_ORG_ID      NUMBER,
   Attribute1         VARCHAR2 (4000 BYTE),
   Attribute2         VARCHAR2 (4000 BYTE),
   Attribute3         VARCHAR2 (4000 BYTE),
   Attribute4         VARCHAR2 (4000 BYTE),
   Attribute5         VARCHAR2 (4000 BYTE),
   Attribute6         VARCHAR2 (4000 BYTE),
   Attribute7         VARCHAR2 (4000 BYTE),
   Attribute8         VARCHAR2 (4000 BYTE),
   Attribute9         VARCHAR2 (4000 BYTE),
   Attribute10        VARCHAR2 (4000 BYTE),
   Attribute11        VARCHAR2 (4000 BYTE),
   Attribute12        VARCHAR2 (4000 BYTE),
   Attribute13        VARCHAR2 (4000 BYTE),
   Attribute14        VARCHAR2 (4000 BYTE),
   Attribute15        VARCHAR2 (4000 BYTE),
   END_DATE           DATE,
   CREATED_BY         VARCHAR2 (30 BYTE) DEFAULT '-1',
   CREATION_DATE      DATE DEFAULT SYSDATE,
   LAST_UPDATED_BY    VARCHAR2 (30 BYTE) DEFAULT '-1',
   LAST_UPDATE_DATE   DATE DEFAULT SYSDATE,
   VERSION_NUMBER     NUMBER DEFAULT 1,
   unique(PARENT_ORG_ID,ORG_NUM)
);

CREATE TABLE ORG_VALIDATION_GROUPS
(
   CLIENT_ID          NUMBER NOT NULL,
   APPLICATION_ID     NUMBER NOT NULL,
   ORG_VALIDATION_GROUP_ID NUMBER PRIMARY KEY,
   GROUP_ID              NUMBER NOT NULL,
   ORG_ID                NUMBER NOT NULL,
   FISCAL_YEAR          NUMBER NOT NULL,
   ORG_LEVEL          NUMBER NOT NULL,
   PRIORITY                NUMBER DEFAULT 1,
   END_DATE           DATE,
   Attribute1         VARCHAR2 (4000 BYTE),
   Attribute2         VARCHAR2 (4000 BYTE),
   Attribute3         VARCHAR2 (4000 BYTE),
   Attribute4         VARCHAR2 (4000 BYTE),
   Attribute5         VARCHAR2 (4000 BYTE),
   Attribute6         VARCHAR2 (4000 BYTE),
   Attribute7         VARCHAR2 (4000 BYTE),
   Attribute8         VARCHAR2 (4000 BYTE),
   Attribute9         VARCHAR2 (4000 BYTE),
   Attribute10        VARCHAR2 (4000 BYTE),
   Attribute11        VARCHAR2 (4000 BYTE),
   Attribute12        VARCHAR2 (4000 BYTE),
   Attribute13        VARCHAR2 (4000 BYTE),
   Attribute14        VARCHAR2 (4000 BYTE),
   Attribute15        VARCHAR2 (4000 BYTE),
   CREATED_BY         VARCHAR2 (30 BYTE) DEFAULT '-1',
   CREATION_DATE      DATE DEFAULT SYSDATE,
   LAST_UPDATED_BY    VARCHAR2 (30 BYTE) DEFAULT '-1',
   LAST_UPDATE_DATE   DATE DEFAULT SYSDATE,
   VERSION_NUMBER     NUMBER DEFAULT 1,
   UNIQUE (GROUP_ID,ORG_ID,FISCAL_YEAR)
);


CREATE TABLE TABLE_FIELDS
(
   CLIENT_ID          NUMBER NOT NULL,
   TABLE_FIELD_ID     NUMBER PRIMARY KEY,
   TABLE_NAME		  VARCHAR2(30 BYTE) NOT NULL,
   FIELD_NAME		  VARCHAR2(30 BYTE) NOT NULL,
   SR_NUM			  NUMBER NOT NULL,
   IS_MANDATORY		  CHAR (1 BYTE) DEFAULT 'N',
   WHERE_CONDITION    VARCHAR2 (4000 BYTE),       
   Attribute1         VARCHAR2 (4000 BYTE),
   Attribute2         VARCHAR2 (4000 BYTE),
   Attribute3         VARCHAR2 (4000 BYTE),
   Attribute4         VARCHAR2 (4000 BYTE),
   Attribute5         VARCHAR2 (4000 BYTE),
   Attribute6         VARCHAR2 (4000 BYTE),
   Attribute7         VARCHAR2 (4000 BYTE),
   Attribute8         VARCHAR2 (4000 BYTE),
   Attribute9         VARCHAR2 (4000 BYTE),
   Attribute10        VARCHAR2 (4000 BYTE),
   Attribute11        VARCHAR2 (4000 BYTE),
   Attribute12        VARCHAR2 (4000 BYTE),
   Attribute13        VARCHAR2 (4000 BYTE),
   Attribute14        VARCHAR2 (4000 BYTE),
   Attribute15        VARCHAR2 (4000 BYTE),
   CREATED_BY         VARCHAR2 (30 BYTE) DEFAULT '-1',
   CREATION_DATE      DATE DEFAULT SYSDATE,
   LAST_UPDATED_BY    VARCHAR2 (30 BYTE) DEFAULT '-1',
   LAST_UPDATE_DATE   DATE DEFAULT SYSDATE,
   VERSION_NUMBER     NUMBER DEFAULT 1,
   unique (TABLE_NAME,FIELD_NAME)
);

CREATE TABLE DISTRIBUTION_GROUPS(
	CLIENT_ID          NUMBER NOT NULL,
	DIST_GROUP_ID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	GROUP_NAME         VARCHAR2 (500 BYTE) UNIQUE NOT NULL,
	Description        VARCHAR2 (4000 BYTE) NOT NULL,
    END_DATE           DATE,
    ATTRIBUTE1         VARCHAR2 (4000 BYTE),
    ATTRIBUTE2         VARCHAR2 (4000 BYTE),
    ATTRIBUTE3         VARCHAR2 (4000 BYTE),
    ATTRIBUTE4         VARCHAR2 (4000 BYTE),
    ATTRIBUTE5         VARCHAR2 (4000 BYTE),
    ATTRIBUTE6         VARCHAR2 (4000 BYTE),
    ATTRIBUTE7         VARCHAR2 (4000 BYTE),
    ATTRIBUTE8         VARCHAR2 (4000 BYTE),
    ATTRIBUTE9         VARCHAR2 (4000 BYTE),
    ATTRIBUTE10        VARCHAR2 (4000 BYTE),
    ATTRIBUTE11        VARCHAR2 (4000 BYTE),
    ATTRIBUTE12        VARCHAR2 (4000 BYTE),
    ATTRIBUTE13        VARCHAR2 (4000 BYTE),
    ATTRIBUTE14        VARCHAR2 (4000 BYTE),
    ATTRIBUTE15        VARCHAR2 (4000 BYTE),
    CREATED_BY         VARCHAR2 (30 BYTE) DEFAULT '-1',
    CREATION_DATE      DATE DEFAULT SYSDATE,
    LAST_UPDATED_BY    VARCHAR2 (30 BYTE) DEFAULT '-1',
    LAST_UPDATE_DATE   DATE DEFAULT SYSDATE,
    VERSION_NUMBER     NUMBER DEFAULT 1
);