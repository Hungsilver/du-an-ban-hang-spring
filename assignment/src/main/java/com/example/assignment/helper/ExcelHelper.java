package com.example.assignment.helper;

import com.example.assignment.entity.Brand;
import com.example.assignment.entity.Category;
import com.example.assignment.entity.Color;
import com.example.assignment.entity.Product;
import com.example.assignment.service.BrandService;
import com.example.assignment.service.CategoryService;
import com.example.assignment.service.ColorService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component
public class ExcelHelper {
    public String TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    public final String[] HEADERS =
            {"id", "name", "image", "price", "quantity", "description", "idBrand",
                    "idCategory", "idColor", "createDate", "updatedDate", "status"};
    public final String SHEET = "Products";

    @Autowired
    ColorService colorService;
    @Autowired
    BrandService brandService;
    @Autowired
    CategoryService categoryService;


    public boolean hasExcelFormat(MultipartFile file) {
        if (!TYPE.equals(file.getContentType())) {
            return false;
        }
        return true;
    }

    public ByteArrayInputStream productsToExcel(List<Product> product) {
        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.getSheet(SHEET);

        } catch (IOException e) {
            throw new RuntimeException("failed to import data to excel file: " + e.getMessage());
        }
        return null;
    }

    public List<Product> excelToProducts(InputStream is) {
        try {
            Workbook workbook = new XSSFWorkbook(is);
            Sheet sheet = workbook.getSheet(SHEET);
            Iterator<Row> rows = sheet.iterator();
            List<Product> products = new ArrayList<>();

            int rowNumber = 0;
            while (rows.hasNext()) {
                Row currentRow = rows.next();
                //bo qua dong dau tien
                if (rowNumber == 0) {
                    rowNumber++;
                    continue;
                }

                Iterator<Cell> cellsInRow = currentRow.iterator();
                Product product = new Product();
                int cellInx = 0;
                while (cellsInRow.hasNext()) {
                    Cell currentCell = cellsInRow.next();
                    switch (cellInx) {
                        case 0:
                            product.setName(currentCell.getStringCellValue());
                            break;
                        case 1:
                            product.setImage(currentCell.getStringCellValue());
                            break;
                        case 2:
                            product.setPrice((int) currentCell.getNumericCellValue());
                            break;
                        case 3:
                            product.setQuantity((int) (currentCell.getNumericCellValue()));
                            break;
                        case 4:
                            product.setDescription(currentCell.getStringCellValue());
                            break;
                        case 5:
                            Brand brand = brandService.getOne((long) currentCell.getNumericCellValue());
                            product.setBrand(brand);
                            break;
                        case 6:
                            Category category = categoryService.getOne((long) currentCell.getNumericCellValue());
                            product.setCategory(category);
                            break;
                        case 7:
                            Color color = colorService.getOne((long) currentCell.getNumericCellValue());
                            product.setColor(color);
                            break;
                        case 8:
                            LocalDate createdDate = currentCell.getDateCellValue().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                            product.setCreateDate(createdDate);
                            break;
                        case 9:
                            LocalDate updatedDate = currentCell.getDateCellValue().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                            product.setUpdatedDate(updatedDate);
                            break;
                        case 10:
                            product.setStatus((int) currentCell.getNumericCellValue());
                            break;
                        default:
                            break;
                    }
                    cellInx++;
                }
                products.add(product);
            }
            workbook.close();
            return products;
        } catch (IOException e) {
            throw new RuntimeException("Error import excel to Products : " + e.getMessage());
        }
    }


}
