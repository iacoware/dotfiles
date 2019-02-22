function server --description 'http simple server'
  sleep 1 && open "http://localhost:8000/" &
  
  python -m SimpleHTTPServer 8000
end