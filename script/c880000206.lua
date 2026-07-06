-- AUTO-GENERATED: OP01-083 / Mr.1(다즈 보네스)
-- rules_id=OP01-083 script_id=880000206 fingerprint=a46751625bc4d85340ab61d4889572877561d885ef0d05f7ffd1827efe370e98
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount_per=1000,
            divisor=2,
            duration=[[WHILE_CONDITION]],
            filter={
              card_type=[[EVENT]],
            },
            op=[[MODIFY_POWER_PER_COUNT]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            source=[[TRASH]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】자신의 리더가 《바로크 워크스》 특징을 가진 경우, 자신의 트래시에 있는 이벤트 2장당 이 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-083]],
    schema_version=1,
  })
end
