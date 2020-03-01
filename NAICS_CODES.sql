insert into xxaas_lookups
(client_id,lookup_id,lookup,lookup_name,lookup_desc)
values (
1,
xxaas_lookup_seq.nextval,
'NAICS_CODE',
'NAICS_CODE',
'Lookup for NAICS Codes');

insert into xxaas_lookup_values
(client_id,lookup_value_id,lookup_name,lookup_value,lookup_value_code,lookup_value_desc,display_order)
SELECT 
1,
xxaas_lookup_value_seq.nextval,
'NAICS_CODE',
NAICS_CODE,
NAICS_CODE,
NAICS_DESCRIPTION,rownum
from 
sba_ocfo_aas_naics_codes;

commit;
