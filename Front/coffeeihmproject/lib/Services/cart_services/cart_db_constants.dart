const String dbName = "useercart.db";
const String cartTable = "cart";
const String userIdColumn = "userId";
const String itemIdColumn = "itemId";
const String itemNameColumn = "itemName";
const String itemCostColumn = "itemCost";
const String itemQteColumn = "itemQte";
const String itemImgColumn = "itemImg";
const String createCartTable = '''
            CREATE TABLE IF NOT EXISTS "cart"(
              "userId"  TEXT NOT NULL,
              "itemId" TEXT NOT NULL,
              "itemName" TEXT NOT NULL,
              "itemCost" TEXT NOT NULL,
              "itemQte" INTEGER NOT NULL,
              "itemImg" TEXT NOT NULL,
              PRIMARY KEY("itemId")
            );''';
