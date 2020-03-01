alter table XXAAS_ORG_DIST_GROUPS
    rename to ORG_DISTRIBUTION_GROUPS;
    
    alter table distribution_groups
    drop column org_id;