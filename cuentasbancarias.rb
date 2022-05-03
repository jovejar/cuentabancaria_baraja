class Usuario  
  attr_accessor :nombre, :cuentas
  def initialize(nombre, *cuentas) 
      @nombre = nombre
      @cuentas = cuentas
  end
  def saldo_total
      saldo_final = @cuentas.map {|cuenta| cuenta.saldo}.sum
      "La suma de todos los saldos del usuario es de #{saldo_final}"
  end   
end

class CuentaBancaria
  attr_accessor :banco, :numero_de_cuenta, :saldo
  def initialize(banco, numero_de_cuenta, saldo = 0)
      @banco = banco
      @numero_de_cuenta = numero_de_cuenta 
      @saldo = saldo
  end

  def transferir(monto, otra_cuenta) 
      @saldo = @saldo - monto
      otra_cuenta.saldo = monto + otra_cuenta.saldo
  end
end
#prueba método saldo_total
cuenta1 = CuentaBancaria.new('Santander', '123-456', 5000)
cuenta2 = CuentaBancaria.new('Scotiabank', '789-012', 5000)
cuenta3 = CuentaBancaria.new('Banco Chile', '123-012', 4000)
cuenta4 = CuentaBancaria.new('Banco Falabella', '123-012', 2000)
cliente1 = Usuario.new('Pepita', cuenta1, cuenta2, cuenta3, cuenta4)
cliente2 = Usuario.new('Juana', cuenta1, cuenta2, cuenta3, cuenta4)

puts cliente1.saldo_total
puts "-------------------------"
#prueba método transferir
puts "nombre cliente cuenta origen: #{cliente1.nombre}"
puts "banco cliente: #{cuenta1.banco}"
puts "cuenta bancaria cliente: #{cuenta1.numero_de_cuenta}"
puts "saldo inicial cuenta origen: #{cuenta1.saldo}"
puts "-------------------------"
puts "saldo inicial cuenta destino: #{cuenta2.saldo}"
cuenta1.transferir(5000, cuenta2)
puts "nombre cliente cuenta destino: #{cliente2.nombre}"
puts "banco cliente: #{cuenta2.banco}"
puts "cuenta bancaria cliente: #{cuenta2.numero_de_cuenta}"
puts "saldo cuenta destino después de la transferencia: #{cuenta2.saldo}"
puts "-------------------------"
puts "saldo cuenta origen después de la transferencia: #{cuenta1.saldo}"
