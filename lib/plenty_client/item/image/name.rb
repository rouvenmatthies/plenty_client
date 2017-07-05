module PlentyClient
  module Item
    module Image
      class Name
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_IMAGE_NAME_PATH    = '/items/{itemId}/images'.freeze

        CREATE_ITEM_IMAGE_NAMES  = '/{imageId}/names'.freeze
        LIST_ITEM_IMAGE_NAME     = '/{imageId}/names'.freeze
        GET_ITEMS_IMAGE_NAME     = '/{imageId}/names/{lang}'.freeze
        UPDATE_ITEMS_IMAGE_NAME  = '/{imageId}/names/{lang}'.freeze
        DELETE_ITEMS_IMAGE_NAME  = '/{imageId}/names/{lang}'.freeze

        class << self
          def create(item_id, image_id, headers = {})
            post(build_endpoint("#{ITEM_IMAGE_NAME_PATH}#{CREATE_ITEM_IMAGE_NAMES}"),
                                item: item_id,
                                image: image_id,
                                headers)
          end

          def list(item_id, image_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_IMAGE_NAME_PATH}#{LIST_ITEM_IMAGE_NAME}"),
                                item: item_id,
                                image: image_id,
                                headers, &block)
          end

          def find(item_id,  image_id, lang, headers = {}, &block)
            get(build_endpoint("#{ITEM_IMAGE_NAME_PATH}#{GET_ITEMS_IMAGE_NAME}",
                               item: item_id,
                               image: image_id,
                               lang: lang),
                               headers, &block)
          end

          def update(item_id, image_id, lang, body = {})
            put(build_endpoint("#{ITEM_IMAGE_NAME_PATH}#{UPDATE_ITEMS_IMAGE_NAME}",
                               item: item_id,
                               image: image_id,
                               lang: lang),
                               body)
          end

          def delete(item_id, image_id, lang)
            delete(build_endpoint("#{ITEM_IMAGE_NAME_PATH}#{DELETE_ITEMS_IMAGE_NAME}",
                                  item: item_id,
                                  image: image_id,
                                  lang: lang))
          end
        end
      end
    end
  end
end
