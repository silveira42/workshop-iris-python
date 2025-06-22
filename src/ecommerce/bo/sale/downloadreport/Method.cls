Include Ensemble

Class ecommerce.bo.sale.downloadreport.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.sale.Operation, pRequest As ecommerce.bo.sale.downloadreport.Request, Output pResponse As ecommerce.bo.sale.downloadreport.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set report = pRequest.SalesReport

		Set stream = ..GeneratePdf(report)

		Set pResponse.Report = stream
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

ClassMethod GeneratePdf(pReport As ecommerce.model.SalesReport) As %Stream.GlobalBinary [ Language = python ]
{
	from reportlab.lib.pagesizes import letter
	from reportlab.pdfgen import canvas
	from reportlab.lib import colors
	from io import BytesIO
	import iris

	buffer = BytesIO()
	pdf = canvas.Canvas(buffer, pagesize=letter)
	width, height = letter

	# Title
	pdf.setFont("Helvetica-Bold", 16)
	pdf.drawString(50, height - 50, "Relatório de Vendas")

	# Campos do relatório
	pdf.setFont("Helvetica", 12)
	y = height - 90
	line_height = 20

	fields = [
		("Data Inicial", getattr(pReport, "InitialDate", "")),
		("Data Final", getattr(pReport, "FinalDate", "")),
		("Valor Bruto", str(getattr(pReport, "RawValue", ""))),
		("Desconto", str(getattr(pReport, "Discount", ""))),
		("Receita Líquida", str(getattr(pReport, "LiquidRevenue", ""))),
		("Quantidade Vendida", str(getattr(pReport, "SalesQuantity", ""))),
		("ICMS", str(getattr(pReport, "ICMS", ""))),
		("ISS", str(getattr(pReport, "ISS", ""))),
	]

	for label, value in fields:
		pdf.drawString(50, y, f"{label}: {value}")
		y -= line_height

	pdf.showPage()
	pdf.save()

	pdf_bytes = buffer.getvalue()
	buffer.close()

	Stream = iris._Stream.GlobalBinary
	stream = Stream._New()
	stream.Write(pdf_bytes)

	return stream
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
