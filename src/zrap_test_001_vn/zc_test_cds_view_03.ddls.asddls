define view entity ZC_TEST_CDS_VIEW_03
  with parameters
    p_date : datum
  as select from ZI_TEST_CDS_VIEW_03( p_mandt: $session.client, p_pdate: $parameters.p_date ) as ZI_TEST_CDS_VIEW_03
{
  key companycode,
  key material
}
