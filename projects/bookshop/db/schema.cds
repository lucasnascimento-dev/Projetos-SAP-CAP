using {managed} from '@sap/cds/common';

namespace sales;

entity SalesOrderHeaders : managed {
  key id          : UUID;
      customer    : Association to Customers;
      totalAmount : Decimal(15, 2);
      itens       : Composition of many SalesOrderItems
                      on itens.header = $self
}

entity SalesOrderItems {
  key id       : UUID;
      header   : Association to SalesOrderHeaders;
      product  : Association to Products;
      quantity : Integer;
      price    : Decimal(12, 2);
}

entity Customers {
  key id        : UUID;
      firstName : String(20);
      lastName  : String(100);
      email     : String(225);
}

entity Products {
  key id    : UUID;
      name  : String(255);
      price : Decimal(15, 2);
}
