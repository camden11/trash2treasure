class SpreadsheetImportResult

  def initialize(file)
    @successes = 0
    @failures = 0
    @file_name = File.basename(file)
    @failed_items = []
  end

  def success
    @successes += 1
  end

  def failure(failed_item_name)
    @failures += 1
    @failed_items << failed_item_name if failed_item_name
  end

  def message
    if @failures == 0 && @successes > 0
      "All #{@successes} items have been created"
    elsif @successes > 0
      message = "#{@successes} items created successfully. Error creating: "
      @failed_items.each do |item|
        message = message + "-#{item} "
      end
      message
    else
      "Error reading file #{@file_name}"
    end
  end

  def flash
    if @successes > 0 && @failures == 0
      :success
    elsif @successes > 0
      :warning
    else
      :danger
    end
  end
end