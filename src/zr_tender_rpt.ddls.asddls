@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tender Report'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZR_TENDER_RPT
  as select distinct from ztenderitem        as b
    inner join            ZR_TENDERHEAD      as a on b.parent_uuid = a.UUID
    inner join            ZCDS_BIDDER_COL    as c on  c.parent_uuid = a.UUID
                                                  and c.item        = b.lineitem
    left outer join       ZI_SALES_QUOTATION as d on  a.UUID                    = d.uuid
                                                  and d.ReferenceSDDocument     = b.salesinq
                                                  and d.ReferenceSDDocumentItem = b.lineitem
    left outer join       ZI_SALES_CONTRACT  as e on  e.uuid               = a.UUID
                                                  and e.SalesQuotation     = d.SalesQuotation
                                                  and e.SalesQuotationItem = d.SalesQuotationItem
    left outer join       ZI_SALES_ORDER     as f on  f.uuid              = a.UUID
                                                  and f.SalesContract     = e.SalesContract
                                                  and f.SalesContractItem = e.SalesContractItem
    
{
         @EndUserText.label: 'Sales Inquiry'
  key    b.salesinq                  as Salesinq,
         @EndUserText.label: 'Sales Inquiry Item'
  key    b.lineitem                  as Lineitem,
         @EndUserText.label: 'Tender Number'
  key    a.TenderNumber,
         @EndUserText.label: 'Sales Quotation'
  key    d.SalesQuotation,
         @EndUserText.label: 'Sales Quotation Item'
  key    d.SalesQuotationItem,
         @EndUserText.label: 'Sales Contract'
  key    e.SalesContract,
         @EndUserText.label: 'Sales Contract Item'
  key    e.SalesContractItem,
         @EndUserText.label: 'Sales Order'
  key    f.SalesOrder,
         @EndUserText.label: 'Sales Order Item'
  key    f.SalesOrderItem,
         @EndUserText.label: 'Sales Quotation Material'
         d.Material                  as quotemat,
         @EndUserText.label: 'Sales Quotation Item Text'
         d.SalesQuotationItemText,
         d.OrderQuantityUnit,
         @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
         @EndUserText.label: 'Sales Quotation Qunatity'
         d.OrderQuantity,
         d.TransactionCurrency,
         @Semantics.amount.currencyCode: 'TransactionCurrency'
         @EndUserText.label: 'Sales Quotation Amount'
         d.NetAmount,
         @EndUserText.label: 'Sales Contract Material'
         e.Material                  as contmat,
         @EndUserText.label: 'Sales Contract Item Text'
         e.SalesContractItemText,
         e.OrderQuantityUnit         as contquanunit,
         @Semantics.quantity.unitOfMeasure: 'contquanunit'
         @EndUserText.label: 'Sales Contract Qunatity'
         e.OrderQuantity             as contquan,
         e.TransactionCurrency       as concurr,
         @Semantics.amount.currencyCode: 'concurr'
         @EndUserText.label: 'Sales Contract Amount'
         e.NetAmount                 as conamt,
         @EndUserText.label: 'Sales Order Material'
         f.Material as ordmat,
         @EndUserText.label: 'Sales Order Item Text'
         f.SalesOrderItemText,
         f.OrderQuantityUnit         as ordquanunit,
         @Semantics.quantity.unitOfMeasure: 'ordquanunit'
         @EndUserText.label: 'Sales Order Qunatity'
         f.OrderQuantity             as ordqty,
         f.TransactionCurrency       as ordcurr,
         @Semantics.amount.currencyCode:  'ordcurr'
         @EndUserText.label: 'Sales Order Amount'
         f.NetAmount                 as ordamt,
         @EndUserText.label: 'Railway Zone'
         a.RailwayZone,
         @EndUserText.label: 'Tender Type'
         a.TenderType,
         @EndUserText.label: 'Contract Type'
         a.ContractType,
         @EndUserText.label: 'NIT Contact Person'
         a.NitcontactPerson,
         @EndUserText.label: 'Bill To Party'
         a.Billtoparty,
         @EndUserText.label: 'Tender Publishing Date'
         a.TenderStartDate,
         @EndUserText.label: 'Division'
         a.Division,
         @EndUserText.label: 'Bidding Type'
         a.Biddingtype,
         @EndUserText.label: 'Evaluation Criteria'
         a.EvaluationCriteria,
         @EndUserText.label: 'Nominated Person'
         a.NominatedPerson,
         @EndUserText.label: 'Status'
         a.status,
         a.criticality,
         @EndUserText.label: 'Tender Closing Date'
         a.TenderEndDate,
         @EndUserText.label: 'Unit'
         a.Unit,
         a.TenderValueCurr,
         @EndUserText.label: 'Tender Value'
         @Semantics.amount.currencyCode: 'TenderValueCurr'
         a.TenderValue,
         @EndUserText.label: 'Pre-bid Conference'
         a.PrebidConference,
         @EndUserText.label: 'Follow-Up'
         a.FollowUp,
         @EndUserText.label: 'Remark'
         a.Remark,
         @EndUserText.label: 'Remark Date'
         a.RemarkDate,
         @EndUserText.label: 'PSUs'
         a.Psus,
         @EndUserText.label: 'Inspection Agency'
         a.Inspectionagency,
         @EndUserText.label: 'Bidding to be done On'
         a.Biddingtobedoneon,
         @EndUserText.label: 'Bidding System'
         a.Biddingsystem,
         @EndUserText.label: 'Tendering Section'
         a.Tenderingsection,
         @EndUserText.label: 'Item Category'
         a.Itemcategory,
         @EndUserText.label: 'Procure from approved Sources'
         a.Procurefromapprovedsources,
         @EndUserText.label: 'Validity offer days'
         a.Validityofferdays,
         a.TenderDocCurr,
         @EndUserText.label: 'Tender Document Cost'
         @Semantics.amount.currencyCode: 'TenderDocCurr'
         a.Tenderdocumentcost,
         @EndUserText.label: 'Template'
         a.Template,
         a.EmdvalueCurr,
         @EndUserText.label: 'EMD Value'
         @Semantics.amount.currencyCode: 'EmdvalueCurr'
         a.Emdvalue,
         @EndUserText.label: 'Contract Category'
         a.Contractcategory,
         a.OpenitemAmountCurr,
         @EndUserText.label: 'Open Item Amount'
         @Semantics.amount.currencyCode: 'OpenitemAmountCurr'
         a.OpenitemAmount,
         @EndUserText.label: 'Sales Inquiry Material'
         b.material                  as Material,
         @EndUserText.label: 'Sales Inquiry Material Text'
         b.materialtext              as Materialtext,
         b.uom                       as Uom,
         @EndUserText.label: 'Sales Inquiry Quantity'
         @Semantics.quantity.unitOfMeasure: 'Uom'
         b.qunatity                  as Qunatity,
         @EndUserText.label: 'Drawing Number'
         b.drawing_no                as DrawingNo,
         @EndUserText.label: 'Feasiblity Check Status'
         b.feasiblity_check_status   as FeasiblityCheckStatus,
         @EndUserText.label: 'PlNo'
         b.pl_no                     as PlNo,
         @EndUserText.label: 'Bid Decision'
         b.bid_decision              as BidDecision,
         @EndUserText.label: 'ARIL Position'
         b.arilposition              as Arilposition,
         @EndUserText.label: 'L1 Bidding Company'
         c.L1Company,
         @EndUserText.label: 'L1 Quoted Rate'
         c.L1QuotedRate,
         @EndUserText.label: 'L2 Bidding Company'
         c.L2Company,
         @EndUserText.label: 'L2 Quoted Rate'
         c.L2QuotedRate,
         @EndUserText.label: 'L3 Bidding Company'
         c.L3Company,
         @EndUserText.label: 'L3 Quoted Rate'
         c.L3QuotedRate,
         @EndUserText.label: 'L4 Bidding Company'
         c.L4Company,
         @EndUserText.label: 'L4 Quoted Rate'
         c.L4QuotedRate,
         @EndUserText.label: 'L5 Bidding Company'
         c.L5Company,
         @EndUserText.label: 'L5 Quoted Rate'
         c.L5QuotedRate,
         @EndUserText.label: 'Contract Status'
         d.status                    as contractsts,
         d.criticality               as salescontcrit,
         @EndUserText.label: 'BID ID'
         d.PurchaseOrderByCustomer   as bidid,
         @EndUserText.label: 'BID Date'
         d.CustomerPurchaseOrderDate as bididdate,
         @EndUserText.label: 'Order Status'
         e.status                    as ordsts,
         e.criticality               as ordcrit,
         @EndUserText.label: 'Purchase Order By Customer'
         f.PurchaseOrderByCustomer,
         @EndUserText.label: 'Purchase Order By Customer Date'
         f.CustomerPurchaseOrderDate

}
