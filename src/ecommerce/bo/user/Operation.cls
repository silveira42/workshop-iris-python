Class ecommerce.bo.user.Operation Extends Ens.BusinessOperation
{

XData MessageMap
{
<MapItems>
	<MapItem MessageType="ecommerce.bo.user.create.Request">
		<Method>Create</Method>
	</MapItem>
</MapItems>
}

Method Create(pRequest As ecommerce.bo.user.create.Request, Output pResponse As ecommerce.bo.user.create.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.user.create.Method).Execute(##this, pRequest, .pResponse)
}

}
