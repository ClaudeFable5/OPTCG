-- AUTO-GENERATED: OP10-062 / 바이올렛
-- rules_id=OP10-062 script_id=880001277 fingerprint=729ae9f991373987505f69a25bd894952f33eab851ff51ebdbcfaf4369ed0f96
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
              color=[[PURPLE]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[돈키호테 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】두웅!!-1: 자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 자신의 트래시에서 자색 이벤트를 1장까지 패에 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP10-062]],
    schema_version=1,
  })
end
