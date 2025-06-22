Class ecommerce.bo.sale.Operation Extends Ens.BusinessOperation
{

XData MessageMap
{
<MapItems>
	<MapItem MessageType="ecommerce.bo.sale.downloadreport.Request">
		<Method>DownloadReport</Method>
	</MapItem>
	<MapItem MessageType="ecommerce.bo.sale.generatereport.Request">
		<Method>GenerateReport</Method>
	</MapItem>
	<MapItem MessageType="ecommerce.bo.sale.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="ecommerce.bo.sale.list.Request">
		<Method>List</Method>
	</MapItem>
</MapItems>
}

Method DownloadReport(pRequest As ecommerce.bo.sale.downloadreport.Request, Output pResponse As ecommerce.bo.sale.downloadreport.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.sale.downloadreport.Method).Execute(##this, pRequest, .pResponse)
}

Method GenerateReport(pRequest As ecommerce.bo.sale.generatereport.Request, Output pResponse As ecommerce.bo.sale.generatereport.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.sale.generatereport.Method).Execute(##this, pRequest, .pResponse)
}

Method Create(pRequest As ecommerce.bo.sale.create.Request, Output pResponse As ecommerce.bo.sale.create.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.sale.create.Method).Execute(##this, pRequest, .pResponse)
}

Method List(pRequest As ecommerce.bo.sale.list.Request, Output pResponse As ecommerce.bo.sale.list.Response) As %Library.Status
{
	Return ##class(ecommerce.bo.sale.list.Method).Execute(##this, pRequest, .pResponse)
}

}
