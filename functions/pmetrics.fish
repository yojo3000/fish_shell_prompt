function pmetrics --wraps=curl --wraps=curl\ -s\ /metrics\ \|\ awk\ \'/^\#\ HELP/\ \{print\ \}\'\ \|\ sort\ \|\ uniq --description 'alias pmetrics=curl'
  curl $argv; 
end
