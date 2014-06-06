module Formtastic
  module Inputs
    class JustDatetimePickerInput 
      include ::Formtastic::Inputs::Base

      def to_html
        input_wrapping do
          combined_value = builder.object.send(method)
          
          hour_value_raw = builder.object.send("#{method}_time_hour")
          if not hour_value_raw.nil?
            hour_value = hour_value_raw
          elsif not combined_value.nil?
            hour_value = combined_value.hour
          else
            hour_value = "00"
          end

          minute_value_raw = builder.object.send("#{method}_time_minute")
          if not minute_value_raw.nil?
            minute_value = minute_value_raw
          elsif not combined_value.nil?
            minute_value = combined_value.min
          else
            minute_value = "00"
          end

          second_value_raw = builder.object.send("#{method}_time_second")
          if not second_value_raw.nil?
            second_value = second_value_raw
          elsif not combined_value.nil?
            second_value = combined_value.sec
          else
            second_value = "00"
          end

          hour_value   = sprintf("%02d", hour_value)
          minute_value = sprintf("%02d", minute_value)
          second_value = sprintf("%02d", second_value)
          
          label_html <<
          builder.text_field("#{method}_date", input_html_options.merge({ :class => "just-datetime-picker-field just-datetime-picker-date datepicker", :value => builder.object.send("#{method}_date"), :maxlength => 10, :size => 10 })) <<

          builder.text_field("#{method}_time_hour", input_html_options.merge({ :class => "just-datetime-picker-field just-datetime-picker-time just-datetime-picker-time-hour", :value => hour_value, :maxlength => 2, :size => 2 })) <<
          ":" <<
          builder.text_field("#{method}_time_minute", input_html_options.merge({ :class => "just-datetime-picker-field just-datetime-picker-time just-datetime-picker-time-minute", :value => minute_value, :maxlength => 2, :size => 2 }))
          ":" <<
          builder.text_field("#{method}_time_second", input_html_options.merge({ :class => "just-datetime-picker-field just-datetime-picker-time just-datetime-picker-time-second", :value => second_value, :maxlength => 2, :size => 2 }))
        end
      end
    end
  end
end


