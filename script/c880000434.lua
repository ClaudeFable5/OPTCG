-- AUTO-GENERATED: OP03-068 / 미노제브라
-- rules_id=OP03-068 script_id=880000434 fingerprint=689b0f3ac057383291b901b6e6bbe8926c57ef9e42f9d018983b827f93e51000
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-068]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[임펠 다운]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《임펠 다운》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BANISH]],
    },
    rules_id=[[OP03-068]],
    schema_version=1,
  })
end
