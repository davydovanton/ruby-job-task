# Тестовое задание

## Inventory service

### Как запустить

```
cd inventory-serivce
bundle
bundle exec rackup
```

### HTTP API documentation

- `GET /api/items` - возвращает список всех активных эндпоинтов
- `POST /api/item` - Создает новый активный айтем в системе
  - параметры: `{ "item": { "name": String, "price": Int } }`
  - пример body: `{ "item": { "name": "New item", "price": 4000 } }`
- `PUT /api/items/toggle_status/:item_id` - меняет статус айтема на противоположный, возвращает `ok`
