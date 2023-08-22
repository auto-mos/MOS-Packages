curl --request POST \
http://127.0.0.1:8086/api/v2/query?org=mos \
--header 'Authorization: Token frsZuXqJLGN_-DydwTnycMyL8asQHLAPjx7B-aXm5m3IOUR7ctT_nI8SXo0dhcKyFDXVz_HjoadQDC7bRRDzkw==' \
--header 'Accept: application/csv' \
--header 'Content-type: application/vnd.flux' \
--data 'from(bucket: "mos")
  |> range(start: 2023-08-22T00:00:00.000Z, stop: 2023-08-22T23:59:59.000Z)
  |> filter(fn: (r) => r["_field"] == "ns=2;s=ProSix6A106F156S.OperationalData.CurrentPosition.World.Position_X")'
