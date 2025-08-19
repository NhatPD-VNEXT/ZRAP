CLASS zcl_prod_ver_pr_vn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PROD_VER_PR_VN IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    CHECK sy-uname = 'CB9980000188'.
*
*    CHECK purchaserequisitionitem-material IS NOT INITIAL AND "品目コード
*          purchaserequisitionitem-plant IS NOT INITIAL AND "プラント
*          purchaserequisitionitem-purchaserequisitionreleasedate IS NOT INITIAL AND "購買依頼承認日付
*          purchaserequisitionitem-purchasingdocumentitemcategory = '3'. "購買伝票の明細カテゴリ 「L 外注」
*
*    "get Production Version
*    SELECT i_productionversion~productionversion,      "製造バージョン
*           i_productionversion~billofmaterialvariant   "代替 BOM
*        FROM i_productionversion
*        WHERE material = @purchaserequisitionitem-material
*          AND plant = @purchaserequisitionitem-plant
*          AND validitystartdate <= @purchaserequisitionitem-purchaserequisitionreleasedate
*          AND validityenddate >= @purchaserequisitionitem-purchaserequisitionreleasedate
*        INTO TABLE @DATA(ldt_productionversion).
*
*    CHECK sy-subrc = 0.
*    "sort
*    SORT ldt_productionversion BY productionversion.
*    READ TABLE ldt_productionversion ASSIGNING FIELD-SYMBOL(<lds_productionversion>) index 1.
*    IF sy-subrc = 0.
*        purchaserequisitionitemchange-yy1_production_ver_pri = <lds_productionversion>-productionversion. "製造バージョン
*        purchaserequisitionitemchange-yy1_bom_master_pri = <lds_productionversion>-billofmaterialvariant. "代替 BOM
*    ENDIF.
  ENDMETHOD.
ENDCLASS.
