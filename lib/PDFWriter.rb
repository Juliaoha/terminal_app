require 'prawn'
require 'date'

class PDFWriter
    def write_to_pdf(terms)
        count = 0
        Prawn::Document.generate "Terms.pdf" do |pdf|
            pdf.text("#{Date.today.strftime('%a %d %b %Y')}", {:size => 8})
            pdf.text('Terms', {:size => 30, :align => :center})
            terms.each do |term|
                count += 1
                pdf.text("Term ##{count}", {:size => 14})
                pdf.text("Term Name: #{term["name"]}", {:size => 14})
                pdf.text("Sub Name #{term["sub_name"]}", {:size => 14})
                pdf.text("Description: #{term["description"]}", {:size => 14})
                pdf.text("Reference: #{term["reference"]}", {:size => 14})
                pdf.move_down(10)
            end
        end
    end
end