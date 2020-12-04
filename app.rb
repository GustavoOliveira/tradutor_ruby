require_relative "tradutor"

puts("------- Tradutor -------")
puts('Lista de Idiomas:')
puts('PtBr - Português do Brasil')
puts('EnUs - Inglês (Estados Unidos / Internacional)')
puts('ZhCh - Chinês (Simplificado)')
puts('DeAl - Alemão')

print("Digite a mensagem: ")
msg = gets.chomp.to_s

print("Em qual idioma a mensagem está escrita?: ")
de = gets.chomp.to_s

print("Traduzir para: ")
para = gets.chomp.to_s

tradutor = Tradutor.new
resultado = tradutor.traduzir(msg, de, para )

puts resultado