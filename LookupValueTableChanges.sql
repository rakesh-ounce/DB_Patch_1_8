alter table xxaas_lookup_values
add LOOKUP_VALUE_CODE varchar2(250);

update xxaas_lookup_values
set LOOKUP_VALUE_CODE=LOOKUP_VALUE;


update xxaas_lookup_values 
set lookup_value_code=substr(lookup_value,1,1) where lookup_name = 'REQUEST_TYPE';

update xxaas_lookup_values 
set lookup_value_code='PA' where lookup_name = 'REQUEST_TYPE' and lookup_value='PAYROLL';



commit;
