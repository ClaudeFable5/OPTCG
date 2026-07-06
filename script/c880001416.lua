-- AUTO-GENERATED: OP11-082 / 아라마키
-- rules_id=OP11-082 script_id=880001416 fingerprint=7a0b58b1a84263075da053ac4892c11fa4eeb63b28faaaa5296824298b56e0b9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-082]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_ACTIVE_CHARACTER]],
            selector={
              count=1,
              filter={
                trait=[[해군]],
              },
              kind=[[CHARACTER]],
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[해군]],
          },
        },
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《해군》 특징을 가진 경우, 이번 턴 동안, 자신의 《해군》 특징을 가진 캐릭터 1장까지는 액티브 상태인 캐릭터도 어택할 수 있다. 그 후, 자신의 덱 위에서 2장을 트래시에 놓는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-082]],
    schema_version=1,
  })
end
