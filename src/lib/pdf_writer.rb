# frozen_string_literal: true

require 'prawn'
require 'date'

# This class produces a PDF file with all the stored terms
class PDFWriter
  # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
  def write_to_pdf(terms)
    count = 0
    Prawn::Document.generate 'Terms.pdf' do |pdf|
      pdf.text(Date.today.strftime('%a %d %b %Y').to_s, { size: 8 })
      pdf.text('Terms', { size: 30, align: :center })
      terms.each do |term|
        count += 1
        pdf.text("Term ##{count}", { size: 14 })
        pdf.text("Term Name: #{term.name}", { size: 14 })
        pdf.text("Sub Name #{term.sub_name}", { size: 14 })
        pdf.text("Description: #{term.description}", { size: 14 })
        pdf.text("Reference: #{term.reference}", { size: 14 })
        pdf.move_down(10)
      end
    end
  end
  # rubocop:enable Metrics/MethodLength,Metrics/AbcSize
end
