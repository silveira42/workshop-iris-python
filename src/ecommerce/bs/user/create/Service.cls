Class ecommerce.bs.user.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.user.create.Request, Output pOutput As ecommerce.bs.user.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.user.create.Request).%New()

		Set userSchema = ##class(ecommerce.schema.UserCreate).%New()

		$$$ThrowOnError(userSchema.%JSONImport(pInput.Body))

		Set bpRequest.UserSchema = userSchema

		$$$ThrowOnError(..SendRequestSync("Ecommerce User Create", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.user.create.Response

		Set pOutput.UserModel = bpResponse.UserModel
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
