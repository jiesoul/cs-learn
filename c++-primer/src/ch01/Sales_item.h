#ifndef SALES_ITEM_H
#define SALES_ITEM_H
#include <string>
struct Sales_item {
  std::string bookNo;
  unsigned units_sold = 0;
  double revenue = 0.0;
};
#endif
