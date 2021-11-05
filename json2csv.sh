#!/bin/bash

cat coinflex_data.json| jq -r '["asset","network","address", "quantity", "fee", "id", "status", "txId", "requestedAt", "completedAt"], (.withdrawals.data[] | [.asset, .network, .address, .quantity, .fee, .id, .status, .txId, .requestedAt, .completedAt]) | @csv' > withdrawals.csv
cat coinflex_data.json| jq -r '["asset","network","address", "quantity", "id", "status", "txId", "crediteddAt"], (.deposits.data[] | [.asset, .network, .address, .quantity, .id, .status, .txId, .creditedAt]) | @csv' > deposits.csv
cat coinflex_data.json| jq -r '["matchId", "matchTimestamp", "marketCode", "matchQuantity", "matchPrice", "total", "orderMatchType", "fees", "feeInstrumentId", "orderId", "side", "clientOrderId"], (.trades.data[] | [.matchId, .matchTimestamp, .marketCode, .matchQuantity, .matchPrice, .total, .orderMatchType, .fees, .feeInstrumentId, .orderId, .side, .clientOrderId]) | @csv' > trades.csv
