Class ecommerce.bp.sales.downloadreport.Response Extends Ens.Response
{

Property Report As %Stream.GlobalBinary;

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
