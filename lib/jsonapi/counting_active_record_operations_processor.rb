class CountingActiveRecordOperationsProcessor < ActiveRecordOperationsProcessor
  after_find_operation do
    @operation_meta[:total_records] = @operation.record_count
  end
end
