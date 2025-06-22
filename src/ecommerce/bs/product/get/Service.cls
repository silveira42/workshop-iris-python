Class ecommerce.bs.product.get.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.product.get.Request, Output pOutput As ecommerce.bs.product.get.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.product.get.Request).%New()

		Set bpRequest.Sku = pInput.Sku

		$$$ThrowOnError(..SendRequestSync("Ecommerce Product Get", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.product.get.Response

		Set translate = ##class(%SYS.Python).Import("translate")
		Set translator = translate.Translator(pInput.Lang)
		Set translation = translator.translate(bpResponse.Product.Description)

		If (translation [ "IS AN INVALID TARGET LANGUAGE")
		{
			Throw ##class(%Exception.General).%New("Invalid target language (" _ pInput.Lang _ ") for translation.", 400)
		}

		Set bpResponse.Product.Description = translation

		Set pOutput.Product = bpResponse.Product
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
