// This file was generated by generate-manifest.js.
// DO NOT MODIFY. ALL CHANGES WILL BE OVERWRITTEN.

#ifndef REACTTESTAPP_MANIFEST_H_
#define REACTTESTAPP_MANIFEST_H_

#include <any>
#include <map>
#include <optional>
#include <string>
#include <tuple>
#include <vector>

namespace ReactTestApp
{
    struct Component {
        std::string appKey;
        std::optional<std::string> displayName;
        std::optional<std::map<std::string, std::any>> initialProperties;
        std::optional<std::string> presentationStyle;
        std::optional<std::string> slug;
    };

    struct Manifest {
        std::string name;
        std::string displayName;
        std::optional<std::string> bundleRoot;
        std::optional<std::string> singleApp;
        std::optional<std::vector<Component>> components;
    };

    std::optional<std::tuple<Manifest, std::string>> GetManifest(std::string const &filename);

}  // namespace ReactTestApp

#endif  // REACTTESTAPP_MANIFEST_H_
