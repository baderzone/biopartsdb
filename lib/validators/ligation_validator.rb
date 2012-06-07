class LigationValidator < ActiveModel::Validator
  def validate(record)
    unless (record.spcr_product_ids.size > 0 or 
            record.fpcr_product_ids.size > 0)
      record.errors[:pcr_products] << 'You should pick at least one PCR product.'
    end
  end
end