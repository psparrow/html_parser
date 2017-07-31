def post_json(url, payload)
  post(
    url,
    params: payload.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json' }
  )
end
