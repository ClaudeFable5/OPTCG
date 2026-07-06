-- AUTO-GENERATED: EB01-036 / 미노치와와
-- rules_id=EB01-036 script_id=880000035 fingerprint=7969343d788af8d68b3019ce818d0f7b866c6458352a0f51564875dfe099f2ea
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-036]],
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
      [[RUSH]],
    },
    rules_id=[[EB01-036]],
    schema_version=1,
  })
end
