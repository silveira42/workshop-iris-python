Class ecommerce.bo.product.Operation Extends Ens.BusinessOperation
{

XData MessageMap
{
<MapItems>
	<MapItem MessageType="ecommerce.bo.product.list.Request">
		<Method>List</Method>
	</MapItem>
	<MapItem MessageType="ecommerce.bo.product.get.Request">
		<Method>Get</Method>
	</MapItem>
	<MapItem MessageType="ecommerce.bo.product.create.Request">
		<Method>Create</Method>
	</MapItem>
</MapItems>
}

Method List(pRequest As ecommerce.bo.product.list.Request, Output pResponse As ecommerce.bo.product.list.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.product.list.Method).Execute(##this, pRequest, .pResponse)
}

Method Get(pRequest As ecommerce.bo.product.get.Request, Output pResponse As ecommerce.bo.product.get.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.product.get.Method).Execute(##this, pRequest, .pResponse)
}

Method Create(pRequest As ecommerce.bo.product.create.Request, Output pResponse As ecommerce.bo.product.create.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.product.create.Method).Execute(##this, pRequest, .pResponse)
}

}
