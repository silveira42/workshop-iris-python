Class ecommerce.bp.sales.generatereport.Response Extends Ens.Response
{

Property Report As ecommerce.model.SalesReport;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Report</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
