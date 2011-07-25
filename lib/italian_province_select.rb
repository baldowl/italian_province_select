module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using
      # italian_province_options_for_select to generate the list of option
      # tags.
      def italian_province_select(object, method, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_italian_province_select_tag(options, html_options)
      end

      # Returns a string of option tags for all the Italian provinces. 
      # Supply a province name as +selected+ to have it marked as the
      # selected option tag.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call
      # in a regular HTML select tag.
      def italian_province_options_for_select(selected = nil)
        options_for_select(ITALIAN_PROVINCES, selected)
      end

      # All the provinces included in the italian_province_options output.
      ITALIAN_PROVINCES = ["Agrigento", "Alessandria", "Ancona", "Aosta",
        "Arezzo", "Ascoli Piceno", "Asti", "Avellino", "Bari",
        "Barletta-Andria-Trani", "Belluno", "Benevento", "Bergamo",
        "Biella", "Bologna", "Bolzano", "Brescia", "Brindisi", "Cagliari",
        "Caltanissetta", "Campobasso", "Carbonia-Iglesias", "Caserta",
        "Catania", "Catanzaro", "Chieti", "Como", "Cosenza", "Cremona",
        "Crotone", "Cuneo", "Enna", "Fermo", "Ferrara", "Firenze", "Foggia",
        "Forlì-Cesena", "Frosinone", "Genova", "Gorizia", "Grosseto",
        "Imperia", "Isernia", "La Spezia", "L'Aquila", "Latina", "Lecce",
        "Lecco", "Livorno", "Lodi", "Lucca", "Macerata", "Mantova",
        "Massa e Carrara", "Matera", "Medio Campidano", "Messina", "Milano",
        "Modena", "Monza e Brianza", "Napoli", "Novara", "Nuoro",
        "Ogliastra", "Olbia-Tempio", "Oristano", "Padova", "Palermo",
        "Parma", "Pavia", "Perugia", "Pesaro e Urbino", "Pescara",
        "Piacenza", "Pisa", "Pistoia", "Pordenone", "Potenza", "Prato",
        "Ragusa", "Ravenna", "Reggio Calabria", "Reggio Emilia", "Rieti",
        "Rimini", "Roma", "Rovigo", "Salerno", "Sassari", "Savona", "Siena",
        "Siracusa", "Sondrio", "Taranto", "Teramo", "Terni", "Torino",
        "Trapani", "Trento", "Treviso", "Trieste", "Udine", "Varese",
        "Venezia", "Verbano-Cusio-Ossola", "Vercelli", "Verona",
        "Vibo Valentia", "Vicenza", "Viterbo"] unless const_defined?("ITALIAN_PROVINCES")
    end

    class InstanceTag
      def to_italian_province_select_tag(options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(italian_province_options_for_select(value), options,
          value), html_options)
      end
    end

    class FormBuilder
      def italian_province_select(method, options = {}, html_options = {})
        @template.italian_province_select(@object_name, method,
          options.merge(:object => @object), html_options)
      end
    end
  end
end
