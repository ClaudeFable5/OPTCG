-- AUTO-GENERATED: OP11-043 / 빈스모크 이치디
-- rules_id=OP11-043 script_id=880001377 fingerprint=828d0dda01f70cbce12af37edae296fbe32daa4e30ac51395ba804ff32e0befe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            filter={
              trait_contains=[[제르마]],
            },
            op=[[ONLY_CHARACTERS_MATCH]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 캐릭터가 『제르마』를 포함한 특징을 가진 캐릭터뿐이라면, 발동할 수 있다. 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +1000. 그 후, 자신의 덱 위에서 2장을 트래시에 놓는다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-043]],
    schema_version=1,
  })
end
