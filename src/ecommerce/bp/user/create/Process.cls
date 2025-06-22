Class ecommerce.bp.user.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As ecommerce.bp.user.create.Request, Output pResponse As ecommerce.bp.user.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set boRequest = ##class(ecommerce.bo.user.create.Request).%New()

		Set userSchema = pRequest.UserSchema

		$$$ThrowOnError(##class(ecommerce.dt.user.fromSchema).Transform(userSchema, .userModel))

		Set boRequest.UserModel = userModel

		$$$ThrowOnError(..SendRequestSync("Ecommerce User", boRequest, .boResponse))
		#Dim boResponse As ecommerce.bp.user.create.Response

		Set pResponse.UserModel = boResponse.UserModel
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
