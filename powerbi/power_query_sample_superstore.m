// Power Query M — paste into a Blank Query > Advanced Editor.
// Update the path if your local folder differs.
let
    Source = Csv.Document(
        File.Contents("C:\\YOUR\\PROJECT\\PATH\\data\\raw\\Sample - Superstore.csv"),
        [Delimiter=",", Encoding=1252, QuoteStyle=QuoteStyle.Csv]
    ),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(
        PromotedHeaders,
        {
            {"Row ID", Int64.Type},
            {"Order ID", type text},
            {"Order Date", type date},
            {"Ship Date", type date},
            {"Customer ID", type text},
            {"Product ID", type text},
            {"Sales", Currency.Type},
            {"Quantity", Int64.Type},
            {"Discount", type number},
            {"Profit", Currency.Type},
            {"Postal Code", type text}
        },
        "en-US"
    )
in
    ChangedTypes
