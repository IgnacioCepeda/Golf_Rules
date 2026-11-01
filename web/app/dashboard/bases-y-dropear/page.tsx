import { BasicsDroppingSection } from "@/components/basics-dropping-section"
import { RulesPageLayout } from "@/components/rules-page-layout"
import { SectionNavigation } from "@/components/section-navigation"

export default function BasicsDroppingPage() {
  return (
    <RulesPageLayout title="Bases y dropear">
      <BasicsDroppingSection />
      <SectionNavigation next={{ href: "/dashboard/mesa-de-salida", label: "Mesas de salida" }} />
    </RulesPageLayout>
  )
}
