class Dispositivo {
  constructor(modelo, categoria, serial, disponivel) {
    this.modelo = modelo;
    this.categoria = categoria;
    this.serial = serial;
    this.disponivel = disponivel;
  }

  emprestar() {
    if (this.disponivel) {
      this.disponivel = false;
      return true;
    } else {
      return false;
    }
  }

  devolver() {
    this.disponivel = true;
  }
}
class CentroDeEmpréstimos {
  constructor() {
    this.inventario = [];
  }

  adicionarDispositivo(dispositivo) {
    this.inventario.push(dispositivo);
  }

  verificarDispositivo(serial) {
    for (const dispositivo of this.inventario) {
      if (dispositivo.serial === serial) {
        return dispositivo;
      }
    }
    return null;
  }

  emprestarDispositivo(serial) {
    const dispositivo = this.verificarDispositivo(serial);
    if (dispositivo && dispositivo.disponivel) {
      return dispositivo.emprestar();
    } else {
      return false;
    }
  }

  devolverDispositivo(serial) {
    const dispositivo = this.verificarDispositivo(serial);
    if (dispositivo) {
      dispositivo.devolver();
      return true;
    } else {
      return false;
    }
  }
}
// Criar instâncias de Dispositivo
const dispositivo1 = new Dispositivo("Laptop X", "laptop", "123456789", true);
const dispositivo2 = new Dispositivo("Tablet Y", "tablet", "987654321", false);

// Adicionar dispositivos ao inventário
const centroDeEmpréstimos = new CentroDeEmpréstimos();
centroDeEmpréstimos.adicionarDispositivo(dispositivo1);
centroDeEmpréstimos.adicionarDispositivo(dispositivo2);

// Testar funcionalidade de empréstimo e devolução
console.log("Dispositivo 1 disponível antes de emprestar:", dispositivo1.disponivel); // true
const emprestado = centroDeEmpréstimos.emprestarDispositivo("123456789");
console.log("Empréstimo bem-sucedido:", emprestado); // true
console.log("Dispositivo 1 disponível após emprestar:", dispositivo1.disponivel); // false

console.log
