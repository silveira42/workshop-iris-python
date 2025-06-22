Class ecommerce.bp.sale.list.Response Extends Ens.Response
{

Property Sales As list Of ecommerce.model.Sale;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Sales</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
